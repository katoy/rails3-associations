class Ymail < ActiveRecord::Base
  has_many :addressings, :as => :adr
  has_many :addresses, :through => :addressings
end
