class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, default: 1, null: false # 1 represents common_user role
  end
end
