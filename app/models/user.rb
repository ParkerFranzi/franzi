class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role
  has_many :posts
  has_many :comments
  has_many :galleries
  has_many :pictures

  before_create :set_role 
  
  # attr_accessible :title, :body
  ROLES = %w[guest member admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end 

  private

  def set_role
    self.role = 'guest'
  end 
end
