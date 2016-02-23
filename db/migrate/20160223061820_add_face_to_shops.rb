class AddFaceToShops < ActiveRecord::Migration
  def change
    add_column :shops, :face_id, :integer
  end
end
