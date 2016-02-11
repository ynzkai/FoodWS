class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  validates :title, :content, :topic, :user_id, presence: true
end
