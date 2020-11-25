class RemoveCartFromOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :orders do |t|
      t.remove_belongs_to :cart, index: true
    end
  end
end
