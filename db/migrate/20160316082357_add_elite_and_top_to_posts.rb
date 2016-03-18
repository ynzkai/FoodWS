class AddEliteAndTopToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :elite, :bool, default: 0
    add_column :posts, :top, :bool, default: 0
  end
end
