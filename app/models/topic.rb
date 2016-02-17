class Topic < ActiveRecord::Base
  validates :name, presence: true

  has_many :posts, dependent: :nullify
end
