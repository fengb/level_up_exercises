require 'sinatra'
require 'sinatra/base'
require 'sinatra/contrib'
require_relative 'lib/bomb'

class MyBombApp < Sinatra::Base
  enable :sessions

  def self.reset!
    @bomb = Bomb.new("1234", "0000")
  end

  reset!

  class << self
    attr_reader :bomb
  end

  def self.reconfigure(activation, deactivation)
    Bomb.new(activation, deactivation)
  end

  get '/' do
    erb :'bombs/new', locals: { bomb: MyBombApp.bomb }
  end

  post '/new' do
    activation = params[:activation_config]
    deactivation = params[:deactivation_config]
    if activation =~ /^[0-9]*$/ && deactivation =~ /^[0-9]*$/
      MyBombApp.reconfigure(activation, deactivation)
    else
      @message = "Sorry, the code can only contain numbers."
    end
    redirect '/'
  end

  post '/update' do
    @attempt = params[:deactivation_code] || params[:activation_code]
    MyBombApp.bomb.enter_code(@attempt)
    redirect '/'
  end

  # we can shove stuff into the session cookie YAY!
  def start_time
    session[:start_time] ||= Time.now.to_s
  end
end
