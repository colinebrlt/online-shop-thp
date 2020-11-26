class Item < ApplicationRecord
  validates_presence_of :title, :description, :price
  validates :title, uniqueness: { case_sensitive: false }
  validates :price, numericality: { grater_than_or_equal_to: 1 }
  validates :description, length: { in: 20...5000 }
  validate :check_picture_presence

  has_many :line_items, dependent: :destroy
  has_many :order_line_items, dependent: :destroy

  has_one_attached :picture

  private

  def check_picture_presence
    unless self.picture.attached?
      errors.add(:picture, "Vous devez ajouter une photo !")
    end
  end
end
