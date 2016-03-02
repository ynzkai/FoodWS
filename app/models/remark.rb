class Remark < ActiveRecord::Base
  validates :content, :user_id, :remarkable_id, :remarkable_type, presence: true

  belongs_to :user
  belongs_to :remarkable, polymorphic: true
end
