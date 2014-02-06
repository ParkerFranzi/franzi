class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  attr_accessible :body, :post, :user_id

  default_scope order('created_at DESC')
  
  validates :user, presence: true
end
