class CreateRemarks < ActiveRecord::Migration
  def change
    create_table :remarks do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :remarkable, polymorphic: true

      t.timestamps null: false
    end
  end
end
