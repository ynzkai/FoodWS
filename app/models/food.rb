class Food < ActiveRecord::Base
  validates :name, :description, :unit, :price, :discount_price, :state, presence: true
  validates :price, :discount_price, numericality: true

  belongs_to :shop
  belongs_to :user
  has_one :picture, as: :imageable, dependent: :destroy
  has_many :remarks, as: :remarkable, dependent: :destroy

  accepts_nested_attributes_for :picture

  default_scope -> { order created_at: :desc }

  # will_paginate
  self.per_page = 100
end
