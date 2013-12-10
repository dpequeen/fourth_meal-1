class Restaurant < ActiveRecord::Base
  has_many :restaurants_users
  has_many :categories
  has_many :users, through: :restaurants_users
end
