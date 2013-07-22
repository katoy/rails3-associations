class Comment < ActiveRecord::Base
  belongs_to :idea, inverse_of: :comments
  has_many :pictures, as: :imageable

  attr_accessible :body, :user_name, :idea_id
end
