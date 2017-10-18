
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'
require 'sinatra/flash'

enable :sessions
set :database, {adapter: 'sqlite3', database: 'restaurants.sqlite3'}

# Before anything, check if there is a user
before do
	current_user
end

# Before seeing restaurant list, check if there is a user
before ['/restaurants/new', '/restaurant'] do
	redirect '/' unless @current_user
end

# Home page
get '/' do
	@restaurants = Restaurant.all
	@users = User.all
	@ratings = Rating.all
  	erb :home
end

# Restaurant page
get '/restaurant/:id' do 
	@restaurant = Restaurant.find(params[:id])
	erb :restaurant
end

# New restaurant form
get '/restaurants/new' do
	erb :new_restaurant
end

# After posting new restaurant
post '/restaurants' do
	restaurant = Restaurant.new({
		name: params[:name],
		order: params[:order]
	})
	restaurant.save
	# Redirect to rate restaurant
	redirect "/restaurants/#{restaurant.id}/ratings"
end

# New rating form
get '/restaurants/:id/ratings' do
	@restaurant = Restaurant.find(params[:id])
	erb :new_rating
end

# After posting new rating
post '/restaurants/:id/ratings' do
	restaurant = Restaurant.find(params[:id])
	rating = Rating.new({
		user_id: @current_user.id,
		restaurant_id: restaurant.id,
		rating: params[:rating],
		review: params[:review],
		has_been: true
	})
	rating.save
	# Redirect to home page
	redirect '/'
end

# New restaurant form
get '/signup' do
	erb :signup
end

# Signup form
post '/signup' do
	user = User.new({
		first: params[:first],
		last: params[:last],
		username: params[:username],
		password: params[:password]
	})
	user.save
	session[:user_id] = user.id
	session[:password] = user.password
	flash[:message] = "Welcome to your restaurant list!"
	redirect '/'
end

# Login form
post '/login' do
	user = User.find_by(username: params[:username])
	if user && user.password == params[:password]
		session[:user_id] = user.id 
		session[:password] = user.password
		flash[:message] = "Welcome to your restaurant list!"
		redirect '/'
	else
		flash[:message] = "Invalid username and password! Please try again."
		redirect back
	end
end

# Logout
get '/logout' do
	session[:user_id] = nil
	flash[:message] = "You have successfully logged out."
	redirect '/'
end

# Save current user information
def current_user
	@current_user = User.find(session[:user_id]) if session[:user_id]
end



