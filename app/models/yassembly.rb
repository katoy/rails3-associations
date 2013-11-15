class Yassembly < ActiveRecord::Base
  has_many :subscriptions, :as => :attendee
  has_many :part2s, :through => :subscriptions
end
