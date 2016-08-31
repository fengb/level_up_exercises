require_relative '../../overlord.rb'
ENV['RACK_ENV'] = 'test'
require 'rack/test'

describe "Overlord Controller" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  let(:activation_code) { 2345 }
  let(:deactivation_code) { 6789 }
  let(:state) { "inactive" }

  describe 'POST /new' do
    it "validates that state remains inactive upon boot up" do
      post '/new'
      expect(state).to match("inactive")
    end

    it "validates that the activation code is only comprised of numbers" do
      post "/new"
      expect(activation_code.to_i).to be > 0
    end
  end

  describe "POST /deactivate" do
    let(:user_code) { 6789 }
    it "validates that the user deactivation code is correct" do
      post "/deactivate"
      expect(user_code).to equal(deactivation_code)
    end

    it "validates that the state is updated if deactivation is successful" do
      post "/deactivate"
      expect(state).to match("inactive")
    end

    it "validates that the bomb explodes after three failed attempts" do
      post "/deactivate"
      post "/deactivate"
      post "/deactivate"
      expect(state).to match("exploded")
    end

    let(:state) { "exploded" }
    it "validates that the page redirects after bomb explodes" do
      post "/deactivate"
      last_request.url.should include("/edit")
    end
  end

  describe "POST /activate" do
    let(:user_code) { 2345 }
    it "validates that the user activation code is correct" do
      post "/activate"
      expect(user_code.to_i).to be(activation_code)
    end

    it "validates that the bomb state is updated if activation is successful" do
      post "/activate"
      expect(state).to match("active")
    end

    it "validates that state remains active if code is entered twice" do
      post "/activate"
      post "/activate"
      expect(state).to match("active")
    end
  end
end
