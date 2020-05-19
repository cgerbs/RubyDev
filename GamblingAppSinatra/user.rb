require 'sinatra'
require 'dm-core'
require 'dm-migrations'

enable :sessions

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/user.db")

#creating a model for a user on the gambling site
class User
  include DataMapper::Resource

  property :id, Serial
  property :username, Text
  property :password, Text
  property :totalWinnings, Integer
  property :totalLosings, Integer
  property :totalProfit, Integer
end

DataMapper.finalize

post '/logout' do
  @user = User.first(username: session[:username])
  updateWinnings = ((@user.totalWinnings).to_i) + (session[:totalWinnings].to_i)
  updateLosings = ((@user.totalLosings).to_i) - (session[:totalLosings].to_i)
  updateProfit = ((@user.totalProfit).to_i) + (session[:totalProfit].to_i)
  puts updateWinnings
  puts updateLosings
  puts updateProfit

  @user.update(
    totalWinnings: updateWinnings.to_i,
    totalLosings: updateLosings,
    totalProfit: updateProfit
  )
  session.clear
  erb :login
end

get '/gambleUI' do
  @user = User.first(username: session[:username])
  @sesWinnings = session[:totalWinnings]
  @sesLosings = session[:totalLosings]
  @sesProfit = session[:totalProfit]
  @title = 'Gambling Page...'
  erb :gambleUI
end

post '/gambleUI' do
  username = params[:username]
  password = params[:password]
  @sesWinnings = 0
  @sesLosings = 0
  @sesProfit = 0
  @user = User.first(username: params[:username])
  if (@user == nil)
    @user =
      User.create(
        username: "#{username}",
        password: "#{password}",
        totalWinnings: 0,
        totalLosings: 0,
        totalProfit: 0
      )
  end
  session[:username] = username
  @title = 'post /gameleUI'
  erb :gambleUI
end

post '/bet' do
  amount_money = params[:money]
  bet_number = params[:number]
  dice_roll = rand(6) + 1
  puts (dice_roll.to_i)
  puts (bet_number.to_i)
  #dice_roll = 1
  if (bet_number.to_i) == (dice_roll.to_i)
    save_session(amount_money, 0)
  else
    save_session(0, amount_money)
  end
  redirect '/gambleUI'
end

def save_session(winnings, losings)
  if (!session[:totalProfit]) # if does not exist
    session[:totalProfit] = 0
    session[:totalLosings] = 0
    session[:totalWinnings] = 0
  end
  session[:totalLosings] = (session[:totalLosings].to_i) + losings.to_i
  session[:totalWinnings] = (session[:totalWinnings].to_i) + winnings.to_i
  session[:totalProfit] =
    (session[:totalWinnings].to_i) - (session[:totalLosings].to_i)
end
