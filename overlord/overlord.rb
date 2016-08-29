require 'sinatra'
require_relative 'lib/bomb'

enable :sessions

get '/' do
  @state = "inactive"
  erb :'bombs/new'
end

post '/new' do
  activation = params[:activation].to_i
  deactivation = params[:deactivation].to_i
  if activation > 0 && deactivation > 0
    @message = "Your bomb has successfully been activated. Muaahahah!"
    session[:activation] = activation
    session[:deactivation] = deactivation
  else
    @message = "Sorry, the code can only contain numbers."
  end
  erb :'bombs/new'
end

post '/deactivate' do
  @deactivation_attempt = params[:deactivation_code].to_i
  if @deactivation_attempt == session[:deactivation]
    @message = 'You have successfully deactivated.'
    @state = "inactive"
  elsif @count < 3
    @message = "Uh-oh. You didn't successfully deactivate. Please try again."
    @count += 1
    @state = "active"
  elsif @count == 3
    @message = "Oh no!! THE BOMB HAS EXPLODED!"
    @count = 0
    @state = "exploded"
    erb :""
  end
  redirect '/'
end

post '/activate' do
  @activation_attempt = params[:activation].to_i
  if @activation_attempt == session[:activation]
    @message = "Your bomb is successfully activated."
    @state = "active"
  else
    "Please try again."
  end
  redirect '/'
end

# we can shove stuff into the session cookie YAY!
def start_time
  session[:start_time] ||= Time.now.to_s
end
