class Shop < ActiveRecord::Base
  validates :name, :description, :state, :user_id, :area_id,
            :category_id, presence: true

  belongs_to :area
  belongs_to :category
  has_many :foods, dependent: :nullify
  has_one :address, as: :addressable
  has_many :pictures, as: :imageable, dependent: :destroy
  belongs_to :face, class_name: "Picture", foreign_key: :face_id, dependent: :destroy
end
