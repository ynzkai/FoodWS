class Address < ActiveRecord::Base
  belongs_to :addressable, polymorhic: true
end
