class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: {maximum: 10}, uniqueness: true;

  has_many :posts
  has_many :comments

  # user roles
  ROLES = ["guest", "common_user", "merchant", "bbs_admin", "admin", "supper_admin"]

  ROLES.each do |role|
    define_method("#{role}?") { role == ROLES[self.role] }
  end

  # paperclip settings
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
