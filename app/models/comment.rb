class Comment < MyBaseRecord
  attr_accessible :body, :user_name, :picture, :idea_id, :lock_version

  mount_uploader :picture, PictureUploader

  belongs_to :idea, inverse_of: :comments, :counter_cache => true
  has_many :pictures, as: :imageable

  validates :user_name,  length: (4..32), uniqueness: true
  validates :body,       length: (1..4000)

end
