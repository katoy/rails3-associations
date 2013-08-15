class Idea < MyBaseRecord
  attr_accessible :description, :name, :picture, :lock_version

  mount_uploader :picture, PictureUploader

  has_many :comments, dependent: :destroy, :inverse_of => :idea
  has_one :info,      dependent: :destroy, :inverse_of => :idea

  # has_many :idea_tags
  # has_many :tags, through: :idea_tags
  # attr_accessible :tag_ids

  has_many :xcomments
  has_one :xinfo

  has_many :pictures, as: :imageable

  validates :name,        length: (4..32), uniqueness: true
  validates :description, length: (1..4000)
  validates_associated :info
end
