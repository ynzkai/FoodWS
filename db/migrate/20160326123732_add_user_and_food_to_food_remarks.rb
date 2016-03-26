class AddUserAndFoodToFoodRemarks < ActiveRecord::Migration
  def change
    add_reference :food_remarks, :user, index: true, foreign_key: true
    add_reference :food_remarks, :food, index: true, foreign_key: true
  end
end
