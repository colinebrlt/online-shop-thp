class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items

  def total_price
    total = 0
    self.line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    return total
  end
end
