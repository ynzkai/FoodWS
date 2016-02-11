class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: {maximum: 10};


  ROLES = ["guest", "common_user", "merchant", "bbs_admin", "admin", "supper_admin"]

  ROLES.each do |role|
    define_method("#{role}?") { role == ROLES[self.role] }
  end

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
