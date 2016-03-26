class Food < ActiveRecord::Base
  validates :name, :description, :unit, :price, :state, presence: true
  validates :price, numericality: true

  belongs_to :shop
  belongs_to :user
  has_one :picture, as: :imageable, dependent: :destroy
  has_many :food_remarks, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy

  accepts_nested_attributes_for :picture

  default_scope -> { order created_at: :desc }

  STATE = ["待审核", "通过", "不通过"]

  # will_paginate
  self.per_page = 100
end
