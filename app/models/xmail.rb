class Xmail < ActiveRecord::Base
  has_many :addressings, :as => :addr
  has_many :addresses, :through => :addressings
end
