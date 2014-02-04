class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :galleries, dependent: :destroy
  has_many :pictures, dependent: :destroy

  before_create :set_role 
  
  # attr_accessible :title, :body
  ROLES = %w[guest member admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end 

  def all_but_self(user)
    where.not(user_id: user.id)
  end

  private

  def set_role
    self.role = 'guest'
  end 
end
