class Food < ActiveRecord::Base
  validates :name, :description, :state, :user_id, presence: true
  belongs_to :shop
end
