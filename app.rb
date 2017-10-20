
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'
require 'sinatra/flash'
require 'open-uri'
require 'json'
require "rack/utf8_sanitizer"

# require 'carrierwave'
# require 'carrierwave/orm/activerecord'

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

# Newsfeed page
get '/restaurants/newsfeed' do 
	@users = User.all
	@restaurants = Restaurant.all
	@ratings = Rating.all
	@ratings = Rating.all.order(id: :desc)
	erb :newsfeed
end

# Delete restaurant
delete '/restaurant/:id' do
  restaurant = Restaurant.find(params[:id])
  restaurant.ratings.destroy_all
  restaurant.destroy
  redirect '/'
end

# After editing restaurant 
put '/restaurants/:id' do
    restaurant = Restaurant.find(params[:id])
    restaurant.name = params[:name]
    restaurant.order = params[:order]
    restaurant.save
	redirect '/'
end

# Edit restaurant page
get '/restaurant/:id/edit' do
	@restaurant = Restaurant.find(params[:id])
	erb :edit
end

# Restaurant page
get '/restaurant/:id' do 
	@restaurant = Restaurant.find(params[:id])
	unless @restaurant.place_id # go find the place_id if we don't have it
		begin
			data = JSON.parse open("https://maps.googleapis.com/maps/api/place/radarsearch/json?location=40.7074909,-74.01127639999999&radius=1000&type=restaurant&name=#{@restaurant.name}&language=en&key=AIzaSyB2ULJzC_RC0aOjO3aMnEOuw3WPjfCzu7A").read
			@restaurant.place_id = data["results"].first["place_id"]
			detail_data = JSON.parse open("https://maps.googleapis.com/maps/api/place/details/json?maxwidth=400&placeid=#{@restaurant.place_id}&key=AIzaSyB2ULJzC_RC0aOjO3aMnEOuw3WPjfCzu7A").read

			@restaurant.search_name = detail_data["result"]["name"]
			@restaurant.address = detail_data["result"]["formatted_address"]
			@restaurant.number = detail_data["result"]["formatted_phone_number"]
			@restaurant.hours = detail_data["result"]["opening_hours"]["weekday_text"]
			@restaurant.website = detail_data["result"]["website"]

			@restaurant.reviews = detail_data["result"]["reviews"].to_json

			@restaurant.lat = detail_data["result"]["geometry"]["location"]["lat"]
			@restaurant.lng = detail_data["result"]["geometry"]["location"]["lng"]

			@restaurant.save
		rescue 
			p "Failed to pull place data"
		end
	end
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
		created_at: DateTime.now.change(:offset => "+0000"),
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
	redirect '/'
end

# Login form
post '/login' do
	user = User.find_by(username: params[:username])
	if user && user.password == params[:password]
		session[:user_id] = user.id 
		session[:password] = user.password
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



