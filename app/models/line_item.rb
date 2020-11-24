class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  def total
    total = quantity * item.price
  end 
end
