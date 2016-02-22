class AddShopToFood < ActiveRecord::Migration
  def change
    add_reference :foods, :shop, index: true, foreign_key: true
  end
end
