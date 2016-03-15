class Picture < ActiveRecord::Base
  has_attached_file :image, styles: { large: "900x900>", medium: "600x600#", small: "300x300#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :imageable, polymorphic: true
  has_one :shop, foreign_key: :face_id, dependent: :nullify
end
