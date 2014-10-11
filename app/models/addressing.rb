class Addressing < ActiveRecord::Base
  belongs_to :add, :polymorphic => true
  belongs_to :address
end
