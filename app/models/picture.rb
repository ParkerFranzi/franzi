class Picture < ActiveRecord::Base
  attr_accessible :frame, :name, :image
  belongs_to :user
  belongs_to :gallery
  mount_uploader :image, ImageUploader
end
