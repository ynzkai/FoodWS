class AddUserToShopRemarks < ActiveRecord::Migration
  def change
    add_reference :shop_remarks, :user, index: true, foreign_key: true
  end
end
