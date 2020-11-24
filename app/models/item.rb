class Item < ApplicationRecord
  validates_presence_of :title, :description, :price, :image_url
  validates :title, uniqueness: { case_sensitive: false }
  validates :price, numericality: { grater_than_or_equal_to: 1 }
  validates :description, length: { in: 20...5000 }

  has_many :line_items
end
