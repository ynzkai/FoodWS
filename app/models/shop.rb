class Shop < ActiveRecord::Base
  belongs_to :area
  belongs_to :category
  has_many :foods, dependent: :nullify
  has_one :address, as: :addressable
end
