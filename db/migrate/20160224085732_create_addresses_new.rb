class CreateAddressesNew < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.integer :shop_id

      t.timestamps null: false
    end
  end
end
