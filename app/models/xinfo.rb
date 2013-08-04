class Xinfo < ActiveRecord::Base
  belongs_to :idea

 validates :writer, presence: true, length: (1 ..10)  
end
