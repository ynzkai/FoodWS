class FoodRemark < ActiveRecord::Base
  belongs_to :food
  belongs_to :user

  # will_paginate
  self.per_page = 30
end
