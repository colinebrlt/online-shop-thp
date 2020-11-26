class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  has_many :orders
  has_one :cart

  before_create :not_admin

  def has_first_name?
    self.first_name
  end

  def to_param
    first_name
  end

  def not_admin
    self.is_admin = false
  end

  def is_admin?
    self.is_admin
  end
  
end
