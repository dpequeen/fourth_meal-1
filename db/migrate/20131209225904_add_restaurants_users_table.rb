class AddRestaurantsUsersTable < ActiveRecord::Migration
  def change
    create_table :restaurants_users do |t|
      t.references :user
      t.references :restaurant
    end
    # add_column :restaurants_users, :restaurant_id, :integer
    # add_column :restaurants_users, :user_id, :integer
  end
end
