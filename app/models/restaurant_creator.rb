class RestaurantCreator
  def initialize(restaurant_params, current_user)
    Restaurant.create!(restaurant_params)
    Role.create!(restaurant: restaurant, user: current_user, level: "admin")
    UserMailer.notify_restaurant_admin(current_user, restaurant).deliver
    UserMailer.notify_platform_admin(PlatformAdmin.first.user, restaurant).deliver
  end
end
