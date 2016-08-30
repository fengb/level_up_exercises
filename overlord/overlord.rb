require 'sinatra/base'
require 'sinatra'
require_relative 'lib/bomb'

class MyBombApp < Sinatra::Base
  enable :sessions

  def self.reset!
    @@bomb = Bomb.new("1234", "0000")
  end

  reset!

  def self.bomb
    @@bomb
  end

  get '/' do
    erb :'bombs/new', locals: {bomb: @@bomb}
  end

  post '/new' do
   activation = params[:activation]
   deactivation = params[:deactivation]
   if activation =~ /^[0-9]*$/ && deactivation =~ /^[0-9]*$/
      @message = "Your bomb has successfully been booted. Muaahahah!"
    else
      @message = "Sorry, the code can only contain numbers."
    end
    redirect '/'
  end

  post '/deactivate' do
    @deactivation_attempt = params[:deactivation_code]
    @@bomb.enter_code(@deactivation_attempt)
    redirect '/'
  end

  post '/activate' do
    @activation_attempt = params[:activation_code]
    @@bomb.enter_code(@activation_attempt)
    redirect '/'
  end

  # we can shove stuff into the session cookie YAY!
  def start_time
    session[:start_time] ||= Time.now.to_s
  end
end