class Idea < ActiveRecord::Base
  attr_accessible :description, :name, :picture

  mount_uploader :picture, PictureUploader

  has_many :comments, dependent: :destroy, :inverse_of => :idea
  has_one :info,      dependent: :destroy, :inverse_of => :idea

  # has_many :idea_tags
  # has_many :tags, through: :idea_tags
  # attr_accessible :tag_ids

  has_many :xcomments
  has_one :xinfo

  has_many :pictures, as: :imageable

  validates :name, presence: true, length: (4..10), uniqueness: true
end
