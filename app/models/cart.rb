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

  def add_item(item)
    item = line_items.find_by(item_id: item)

    if item 
      item.quantity += 1
    else
      item = line_items.new(item: item)
    end 
    
    return item
  end
  
  def empty
    self.line_items.each do |line_item|
      line_item.destroy
    end
  end

  def number_of_items
    total = 0
    self.line_items.each do |line_item|
      total += line_item.quantity
    end
    total
  end 

  def to_param
    "#{id}-votre-panier"
  end
end
