class Area < ActiveRecord::Base
  validates :name, presence: true

  has_many :shops
end
