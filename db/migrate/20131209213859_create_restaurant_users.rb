class CreateRestaurantUsers < ActiveRecord::Migration
  def change
    create_table :restaurant_users do |t|
      t.references :restaurant, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
