Category.delete_all
Item.delete_all
OrderItem.delete_all
User.delete_all
Order.delete_all
Restaurant.delete_all
Role.delete_all

user = User.create( email: "denvergschool@gmail.com", password: "password")
PlatformAdmin.create(user_id: user.id)
user = User.create( email: "nt@example.com", password: "password")
PlatformAdmin.create(user_id: user.id)
user = User.create( email: "qt@example.com", password: "asdfasdf")
PlatformAdmin.create(user_id: user.id)
user = User.create( email: "kp@example.com", password: "password")
PlatformAdmin.create(user_id: user.id)

user = User.create( email: "asdf@asdf.com", password: "asdfasdf")
user = User.create( email: "qwer@qwer.com", password: "qwerqwer")
user = User.create( email: "zxcv@zxcv.com", password: "zxcvzxcv")

NUMBER_OF_RESTAURANTS = 10
NUMBER_OF_REGIONS = 4
NUMBER_OF_ITEMS = 3
NUMBER_OF_USERS = 10
NUMBER_OF_RESTAURANT_ADMINS = 2
NUMBER_OF_STOCKERS = 2
NUMBER_OF_PLATFORM_ADMINS = 2
NUMBER_OF_CATEGORIES = 3

restaurant_count = 0
category_count = 0
restaurant_admin_count = 0
item_count = 0

NUMBER_OF_RESTAURANTS.times do 
  generated_name = "KFC #{restaurant_count = restaurant_count + 1}"
  generated_description = "KFC is good"
  r = Restaurant.create(name: generated_name, description: generated_description)
  NUMBER_OF_RESTAURANT_ADMINS.times do
    u = User.create(email: "Bobaaaa#{restaurant_admin_count += 1}@gmail.com", password: "password")
    Role.create!(restaurant: r, user: user, level: "admin")
  end
  NUMBER_OF_STOCKERS.times do
    u = User.create(email: "Johnaaaa#{restaurant_admin_count += 1}@gmail.com", password: "password")
    Role.create!(restaurant: r, user: user, level: "stocker")
  end

  NUMBER_OF_CATEGORIES.times do
    c = Category.create(name: "category #{category_count += 1}", restaurant: r)
    NUMBER_OF_ITEMS.times do
      Item.create({name: "item #{item_count += 1}", description: "Not a Sloppy Joe", price: Random.new.rand(20), image_url: "pp.png", category: c})
    end
  end
end



{ "Billy's BBQ" => "Barbecue restaurant",
  "Moe's Q Shack" => "BBQ shack",
  "Knife & fork" => "Upscale Southern food",
  "McDonalds" => "America's finest",
  "Burker King" => "At BK you got it",
  "Wendys" => "Dave Thomas is our hero",
  "Five Guys" => "The best burger in town"
}.each do |restaurant_name, restaurant_description|
  r = Restaurant.create(name:restaurant_name, description:restaurant_description)
  Role.create!(restaurant: r, user: user, level: "admin")
end

Restaurant.all[0..4].each do |restaurant|
  restaurant.status = "approved"
  restaurant.display = true
  restaurant.save
end

categories = Category.create([
  { name: 'Entrees' },
  { name: 'Side Dishes' },
  { name: 'Delightful Drinks' }
  ])

entrees = Category.where(:name => 'Entrees').to_a.first
entrees.items.create([
  { name: 'Pulled Pork Sandy', description: "Not a Sloppy Joe", price: 7, image_url: "pp.png"},
  { name: 'Beef Brisket', description: "Dry rubbed and aged to perfection", price: 8, image_url: "brisket.png"},
  { name: 'Slab-o-Ribs', description: "Finger lick'n good", price: 9, image_url: "ribs.png"}
  ])

sides = Category.where(:name => 'Side Dishes').to_a.first
sides.items.create([
  { name: 'Mac and Cheese', description: "Soooooo cheesy", price: 3, image_url: "mac.png"},
  { name: 'Baked Beans', description: "Better than Bush's", price: 3, image_url: "beans.png"},
  { name: 'Cornbread', description: "Made with real corn", price: 3, image_url: "cornbread.png"}
  ])

drinks = Category.where(:name => 'Delightful Drinks').to_a.first
drinks.items.create([
  { name: 'Iced Tea', description: "Southern Style Sweet Tea", price: 2, image_url: "icedtea.png"},
  { name: 'Naragansett Beer', description: "Borderline Disgusting, but it works", price: 4, image_url: "beer.png"},
  { name: 'Pop', description: "It's not soda", price: 2, image_url: "pop.png"}
  ])
