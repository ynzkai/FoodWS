class AddContactToShops < ActiveRecord::Migration
  def change
    add_column :shops, :telephone, :string
    add_column :shops, :contact, :string
  end
end
