class Shop < ActiveRecord::Base
  validates :name, :description, :state, :user_id, :area_id,
            :category_id, presence: true

  belongs_to :area
  belongs_to :user
  belongs_to :category, -> { where kind: Category::CATEGORY_KIND[:shop] }
  belongs_to :face, class_name: "Picture", foreign_key: :face_id, dependent: :destroy
  has_many :foods, -> { where state: 1 }, dependent: :destroy
  has_one :address,  dependent: :destroy
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :shop_remarks, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy

  accepts_nested_attributes_for :address

  default_scope -> { order created_at: :desc }

  # will_paginate
  self.per_page = 100
end
