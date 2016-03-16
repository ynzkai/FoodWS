class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :content, :topic, :user_id, presence: true
  validates :title, length: {maximum: 50}

  default_scope { order(top: :desc, created_at: :desc) }

  # will_paginate
  self.per_page = 30
end
