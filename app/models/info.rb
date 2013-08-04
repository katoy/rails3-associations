class Info < ActiveRecord::Base
  belongs_to :idea, inverse_of: :info
  attr_accessible :idea, :writer, :idea_id

  validates :writer, length: (1 ..10)  
end
