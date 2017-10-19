
class User < ActiveRecord::Base
  has_many :ratings
  has_many :restaurants, through: :ratings
end

class Restaurant < ActiveRecord::Base
  has_many :ratings
  has_many :users, through: :ratings

  def hours
  	JSON.parse super
  end
end

class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
end



