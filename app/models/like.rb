class Like < ActiveRecord::Base
  validates :user_id, :likable_id, :likable_type, presence: true

  belongs_to :user
  belongs_to :likable, polymorphic: true

end
