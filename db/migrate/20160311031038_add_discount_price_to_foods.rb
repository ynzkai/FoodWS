class AddDiscountPriceToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :discount_price, :decimal
  end
end
