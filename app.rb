
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'
require 'sinatra/flash'

enable :sessions
set :database, {adapter: 'sqlite3', database: 'restaurants.sqlite3'}

before do
	current_user
end

before ['/restaurants/new', '/restaurant'] do
	redirect '/' unless @current_user
end

get '/' do
	@restaurants = Restaurant.all
	@users = User.all
  	erb :home
end

get '/restaurants/new' do
	erb :new_restaurant
end

post '/restaurants' do
	restaurant = Restaurant.new({
		name: params[:name],
		order: params[:order]
	})
	restaurant.save
	redirect '/'
end

post '/login' do
	user = User.find_by(username: params[:username])
	if user && user.password == params[:password]
		session[:user_id] = user.id 
		session[:password] = user.password
		flash[:message] = "Welcome to your our restaurant list!"
		redirect '/'
	else
		flash[:message] = "Oops, please try again."
		redirect back
	end
end

get '/logout' do
	session[:user_id] = nil
	flash[:message] = "You're logged out."
	redirect '/'
end

def current_user
	@current_user = User.find(session[:user_id]) if session[:user_id]
end

