class Order < ApplicationRecord
  belongs_to :user
  has_many :order_line_items

  # after_create :order_send_to_admin, :order_send_to_user

  # def order_send_to_admin
  #   AdminMailer.order(self.user, self.cart).deliver_now
  # end

  # def order_send_to_user
  #   UserMailer.user_order(self.user, self.cart).deliver_now
  # end

  def save_cart(cart)
    cart.line_items.each do |line_item|
      OrderLineItem.create(order_id: self.id, item_id: line_item.item.id, quantity: line_item.quantity)
    end
  end

  def total_price
    total = 0
    self.order_line_items.each do |order_line_item|
      total += order_line_item.item.price * order_line_item.quantity
    end
    return total
  end

  def number_of_items
    total = 0
    self.line_items.each do |order_line_item|
      total += order_line_item.quantity
    end
    return total
  end 

end
