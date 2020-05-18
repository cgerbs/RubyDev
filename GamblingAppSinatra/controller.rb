require 'sinatra'
require_relative 'user' # user's 'lifetime' data managed in this file
#require_relative 'bet_session' 
# individual gambling session data handled in this file


get '/' do
  @title = "Log In Page"
  erb :login   
end

get '/home' do
  @title = "YOU ARE ON HOME PAGE"
  erb :home
end

get '/login' do
  @title = "Log In Page"  
  erb :login  
end

not_found do
  redirect to ('/login')
end

# get '/gambleUI' do
#   @title = "Gambling Page!"
#   erb :gambleUI
# end


