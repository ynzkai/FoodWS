class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :likable, polymorphic: true

      t.timestamps null: false
    end

    add_index(:likes, [:user_id, :likable_id, :likable_type], unique: true)
  end
end
