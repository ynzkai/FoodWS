class ShopRemark < ActiveRecord::Base
  belongs_to :shop
  belongs_to :user

  # will_paginate
  self.per_page = 30
end
