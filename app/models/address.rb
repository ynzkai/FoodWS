class Address < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :addressable, polymorhic: true
end