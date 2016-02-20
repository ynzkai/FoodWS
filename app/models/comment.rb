class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, counter_cache: true

  validates :content, presence: true

  # will_paginate
  self.per_page = 30
end
