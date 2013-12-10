class CreatePlatformAdmins < ActiveRecord::Migration
  def change
    create_table :platform_admins do |t|
      t.belongs_to :user

      t.timestamps
    end
  end
end
