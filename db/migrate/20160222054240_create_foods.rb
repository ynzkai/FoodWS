class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.integer :state, default: 0

      t.timestamps null: false
    end
  end
end
