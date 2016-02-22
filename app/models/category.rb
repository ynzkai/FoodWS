class Category < ActiveRecord::Base
  validates :name, :kind, presence: true

  has_many :shops, dependent: :nullify
end
