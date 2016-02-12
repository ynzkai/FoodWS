class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :content, :topic, :user_id, presence: true
  validates :title, length: {maximum: 50}
end
