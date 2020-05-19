require 'sinatra'

configure do
  set :user, 'user'
  set :pwd, 'pwd'
  enable :sessions
end

def pageViewCounter
  if (!session[:visitsCounter]) #if it does not exist
    session[:visitsCounter] = 1
  else
    tempVar = session[:visitsCounter].to_i #converting to int
    tempVar += 1
    session[:visitsCounter] = tempVar
    puts "number of visits should be = #{session[:visitsCounter]}"
  end
end

get '/' do
  @page = 'homepage'
  @name = settings.user
  @existing_user = session[:existing_user]
  @numberOfVisits = session[:visitsCounter]

  pageViewCounter if @existing_user

  erb :homepage
end

get '/loginPage' do
  @page = 'loginPage'
  @name = settings.user
  @existing_user = session[:existing_user]
  @numberOfVisits = session[:visitsCounter]

  pageViewCounter if @existing_user
  if @existing_user
    erb :homepage
  else
    erb :loginPage
  end
end

post '/loginPage' do
  if params['username'] == settings.user && params['password'] == settings.pwd
    session[:existing_user] = true
    pageViewCounter
    redirect to ('/')
  else
    erb :wrongUserPwd
  end
end

get '/logoutPage' do
  session.clear
  erb :logoutPage
end

not_found { redirect to ('/') }
