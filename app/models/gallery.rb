class Gallery < ActiveRecord::Base
  attr_accessible :title, :description, :image
  belongs_to :user
  has_many :pictures
end
