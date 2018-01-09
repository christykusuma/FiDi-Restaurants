
# Restaurants

Instructions on how to create a Ruby Sinatra website like this one. This is not the main read me file, just some notes.

### Getting started

```bash
touch README.md app.rb Gemfile Rakefile
mkdir public views
mkdir public/css public/js
touch public/css/default.css
touch views/home.erb views/restaurants.erb
```

### Gemfile
We'll be using the following gems, specified in our Gemfile:

```
source 'http://rubygems.org'

gem 'sinatra'
gem 'sqlite3'
gem 'sinatra-activerecord'
gem 'rake'
```

And now we'll `bundle` install.

### Rakefile

To setup our Rakefile (which will help with running migrations) we'll use the following:

```
require 'sinatra/activerecord/rake'
require './app'
```

This loads the rake tools for sinatra activerecord.. and then our application.

### Initial boilerplate for starting our app.rb

```ruby
# app.rb
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, {adapter: 'sqlite3', database: 'restaurants.sqlite3'}

get '/' do
  erb :home
end
```

### Create Migration

We run the following command to run our first migration:

```
rake db:create_migration NAME=initial_schema
```

### Editing the migration

We now want to build our schema for the three tables:


```
users
--
id (int, PK)
first (string)
last (string)
username (string)
password (string)

restaurants
--
id (int, PK)
name (string)
orders (text)

ratings 
--
id (int, PK)
user_id (int, FK)
restaurant_id (int, FK)
rating (int)
has_been (bool)

```

### Create migration

We created our migration with the following:

```ruby
class InitialSchema < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :username
      t.string :password
    end
    create_table :restaurants do |t|
      t.string :name
      t.text :order
    end
    create_table :ratings do |t|
      t.references :user, foreign_key: {to_table: :users}, index: true
      t.references :restaurant, foreign_key: {to_table: :restaurants}, index: true
      t.integer :rating
      t.boolean :has_been
    end
  end
end
```

And then ran: `rake db:migrate`

### Building our models

We'll next want a models.rb file in our project root which we'll use to extend from activerecord and define the relations between tables.

`touch models.rb`

And then let's require it in our `app.rb`

Let's have our models inherit from the ActiveRecord::Base:

```ruby
class User < ActiveRecord::Base
end
class Restaurant < ActiveRecord::Base
end
class Rating < ActiveRecord::Base
end
```

We'll then touch our a seeds file: `touch db/seeds.rb`

### Loading our seed data

`rake db:seed`

### Define ActiveRecord Associations

User has many Ratings
Ratings belongs to a User

Restaurant has many Ratings
Ratings belongs to a Restaurant

+ User has many Restaurants (through Ratings)
+ Restaurant has many Users (through Ratings)

```ruby
class User < ActiveRecord::Base
  has_many :ratings
  has_many :restaurants, through: :ratings
end

class Restaurant < ActiveRecord::Base
  has_many :ratings
  has_many :users, through: :ratings
end

class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
end
```

### Allowing the User to add a new Restaurant

We'll create for a form for adding restaurants.

`touch views/new_restaurant.erb`

### Creating some testing data

```ruby
User.create([
{
	id: 1, 
	first: 'Christy', 
	last: 'Kusuma', 
	username: 'ckusuma', 
	password: 'nycda1'
}, {
	id: 2, 
	first: 'Vikki', 
	last: 'Braxton', 
	username: 'vbraxtvi', 
	password: 'nycda2'
}])

Restaurant.create([
{
	id: 1, 
	name: 'Open Kitchen', 
	order: 'Sushi'
}, {
	id: 2, 
	name: 'Grk', 
	order: 'Portobello griller'
}])

Rating.create([
{
	id: 1, 
	user_id: 1, 
	restaurant_id: 1, 
	rating: 3,
	has_been: true
}, {
	id: 2, 
	user_id: 2, 
	restaurant_id: 2, 
	rating: 4,
	has_been: true
}])
```

### If you changed the schema

You should `rake db:drop` then `rake db:migrate` and `rake db:seed` or `rake db:reset` does it all.

`sqlite3 restaurants.sqlite3`

### If you want to load database on console

You should `irb` and `load './app.rb'


