class Comment < ActiveRecord::Base
  belongs_to :idea, inverse_of: :comments
  attr_accessible :body, :user_name, :idea_id
end
