class AddShopToShopRemarks < ActiveRecord::Migration
  def change
    add_reference :shop_remarks, :shop, index: true, foreign_key: true
  end
end
