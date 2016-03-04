class Category < ActiveRecord::Base
  validates :name, :kind, presence: true

  has_many :shops, -> { where.not state: 0 }, dependent: :nullify

  # kind 1: shops
  CATEGORY_KIND = {shop: 1}

  scope :shop_categories, -> { where kind: 1 }

end
