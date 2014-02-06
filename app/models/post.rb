class Post < ActiveRecord::Base
  has_many :comments, :as => :commentable, dependent: :destroy
  belongs_to :user
  attr_accessible :body, :title, :image

  mount_uploader :image, ImageUploader

  default_scope order('created_at DESC')

  validates :title, length: { minimum: 3 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true  
end
