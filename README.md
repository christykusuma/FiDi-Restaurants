# FiDi Restaurants

This app is aimed at helping New Yorkers, who work at the Financial District, keep track of restaurants near their offices. Once a restaurant is bookmarked, you are able to pull out information based off its closest branch to you and write down your thoughts and ratings. You will also be able to check out where other people have gone through your newsfeed.<br><br>
Feel free to play around with the <a target="_blank" href="https://fidi-restaurants.herokuapp.com/">demo</a> or click the image to enlarge it. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You would need to register for a Google API Key for the maps and the Google Search features used for each individual restaurant.

Add your API Key as an environment variable in your `~/.bash_profile`.

```
export GOOGLEMAP_API_KEY="[YOUR_API_KEY_HERE]"
```

In the terminal:

```
source ~/.bash_profile
```

### Installing

Go to your terminal and bundle install all the gems to get it up and running. 

```
Bundle install
```

If you want to reset the database, you can run these commands.

```
rake db:drop
rake db:migrate
rake db:seed 
```

Or you can also run `rake db:reset`, which does it all.

## Deployment

Follow regular Heroku deployment procedures and it should work just fine. There shouldn't be any extra steps that you would need to take.

## Built With

* CSS - Used for styling
* [Ruby Sinatra](http://sinatrarb.com/documentation.html) - The web framework used
* [SQL](https://dev.mysql.com/doc/) - Database used for development
* [Google Maps API](https://developers.google.com/maps/documentation/javascript/) - API used for maps and markers
* [Google Places API](https://developers.google.com/places/web-service/) - API used for gathering restaurant information

## Authors

* **Christy Kusuma** - [ChristyKusuma](https://github.com/christykusuma)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

