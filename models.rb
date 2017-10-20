
class User < ActiveRecord::Base
  has_many :ratings
  has_many :restaurants, through: :ratings
end

class Restaurant < ActiveRecord::Base
  has_many :ratings
  has_many :users, through: :ratings

  # JSON parse hours
  def hours
  	JSON.parse super
  end

  # # Get photo reference numbers
  # def get_photoreferences
  #   detail_data = JSON.parse open("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=AIzaSyB2ULJzC_RC0aOjO3aMnEOuw3WPjfCzu7A").read
  #   photo_ref = detail_data["result"]["photos"] 

  #   output = []
  #   photo_ref.each do |reference|
  #   	output << reference
  #   end
  #   output
  # end

  # # Get array of photo reference numbers
  # def array_photoreferences
  # 	result = []
  # 	get_photoreferences.each do |reference|
  # 		result << reference["photo_reference"]
  # 	end 
  # 	result
  # end

  # # Print first photo
  # def convert_photo
  # 	reference = array_photoreferences.first
  # 	photo = JSON.parse open("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{reference}&key=AIzaSyB2ULJzC_RC0aOjO3aMnEOuw3WPjfCzu7A").read
 	# photo = photo.tidy_bytes
  # 	output = ""
  # 	output << "<img src=\"photo\">"
  # 	output
  # end

  # def convert_photo
  # 	output = []
  # 	output << array_photoreferences.map {|reference| JSON.parse open("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{reference}&key=AIzaSyB2ULJzC_RC0aOjO3aMnEOuw3WPjfCzu7A").read}
  # 	output
  # end

  # def print_photo
  #  	output = ""
  # 	convert_photo.each do |photo|
  # 		output << "<img src=\"photo\">"
  # 	end
  # 	output
  # end


  # # Print photos out
  # def print_photos
  # 	output = ""
  # 	photos_array.each do |photo|
  # 		output << "<img src=\"photo\">"
  # 	end
  # 	output
  # end


  # # Put photo objects in an array
  # def photos_array
  # 	output = ""
  # 	output << get_photoreferences.map {|reference| JSON.parse open("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{reference}&key=AIzaSyB2ULJzC_RC0aOjO3aMnEOuw3WPjfCzu7A").read}
  # end

  # def print_photos
  # 	photos_array.first
  # end

  # https://maps.googleapis.com/maps/api/place/photo?photoreference=CmRaAAAA-ejIjSL22PMWOZq1OI9PNMdf13RxNhiDgyw4Zz1Am99TgLLMw5iXDqK7ANlMSWLbd9eUm5d2sPxm9aMV1MV5OEwA-EgJbfmcv8JDtmqD07_qTZcPHYP5zFkRiWKDDxdUEhBRFfUiav3583rfxZ002hWpGhSKSj9CkezRPs-arzwRo9WD1ni6Lg&key=AIzaSyB2ULJzC_RC0aOjO3aMnEOuw3WPjfCzu7A

  # CmRaAAAA-ejIjSL22PMWOZq1OI9PNMdf13RxNhiDgyw4Zz1Am99TgLLMw5iXDqK7ANlMSWLbd9eUm5d2sPxm9aMV1MV5OEwA-EgJbfmcv8JDtmqD07_qTZcPHYP5zFkRiWKDDxdUEhBRFfUiav3583rfxZ002hWpGhSKSj9CkezRPs-arzwRo9WD1ni6Lg

  # Get open results from Google API
  def get_open
  	detail_data = JSON.parse open("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=AIzaSyB2ULJzC_RC0aOjO3aMnEOuw3WPjfCzu7A").read
  	detail_data["result"]["opening_hours"]["open_now"]
  end

  # Print whether open or closed
  def print_open
  	output = ""
  	if get_open == true
  		output << "<span style=\"color: green; font-size: 1.2em;\">OPEN</span>"
  	else
  		output << "<span style=\"color: red; font-size: 1.2em;\">CLOSED</span>"
  	end
  	output
  end

  # def get_photos
  #   detail_data = JSON.parse open("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=AIzaSyB2ULJzC_RC0aOjO3aMnEOuw3WPjfCzu7A").read
  #   detail_data["result"]["photos"] 
  # end
	
  # def print_photosreference
  # 	output = ""
  # 	get_photos.each do |photo|
  # 		output << "<div class=\"photo\">#{photo["photo_reference"]}</div>"
  # 	end
  # 	output
  # end

end

class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
end



