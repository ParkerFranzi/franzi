class Picture < ActiveRecord::Base
  attr_accessible :frame, :name
  belongs_to :user
  belongs_to :gallery
end
