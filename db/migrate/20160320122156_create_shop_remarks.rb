class CreateShopRemarks < ActiveRecord::Migration
  def change
    create_table :shop_remarks do |t|
      t.integer :star, default: 0
      t.integer :taste, default: 0
      t.integer :serve, default: 0
      t.integer :environment, default: 0
      t.decimal :price, default: 0
      t.text :remark

      t.timestamps null: false
    end
  end
end
