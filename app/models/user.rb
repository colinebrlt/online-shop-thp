class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  has_many :orders
  has_one :cart

  def has_first_name?
    self.first_name
  end

  def to_param
    last_name
  end

end
