class CreateFoodRemarks < ActiveRecord::Migration
  def change
    create_table :food_remarks do |t|
      t.integer :star
      t.text :remark

      t.timestamps null: false
    end
  end
end
