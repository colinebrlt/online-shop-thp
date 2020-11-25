class OrderLineItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def total
    total = quantity * item.price
  end 
end
