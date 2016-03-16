class AddEliteAndTopToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :elite, :bool
    add_column :posts, :top, :bool
  end
end
