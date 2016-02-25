class Food < ActiveRecord::Base
  validates :name, :description, :unit, :price, :state, presence: true
  validates :price, numericality: true

  belongs_to :shop
  has_one :picture, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :picture
end
