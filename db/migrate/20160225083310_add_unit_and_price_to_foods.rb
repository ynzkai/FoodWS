class AddUnitAndPriceToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :unit, :string
    add_column :foods, :price, :decimal
  end
end
