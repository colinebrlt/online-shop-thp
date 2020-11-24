class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  has_many :orders
  has_one :cart

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def has_first_name?
    self.first_name
  end

end
