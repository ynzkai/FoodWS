class AddDisplayCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :display_count, :integer, default: 0
  end
end
