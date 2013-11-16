class Subscription < ActiveRecord::Base
  belongs_to :attendee, :polymorphic => true
  belongs_to :part2
end
