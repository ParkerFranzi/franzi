class Gallery < ActiveRecord::Base
  attr_accessible :title, :description, :image, :picture
  belongs_to :user
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :pictures, dependent: :destroy
  mount_uploader :image, ImageUploader

  default_scope order('created_at DESC')

  validates :title, length: { minimum: 3 }, presence: true
  validates :description, length: { minimum: 5 }, presence: true
  validates :user, presence: true  
end
