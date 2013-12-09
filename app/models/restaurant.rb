class Restaurant < ActiveRecord::Base
  has_many :restaurant_users
  has_many :categories
end
