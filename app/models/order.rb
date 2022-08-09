class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  def total_price
    order_items.map { |order_item| order_item.quantity * order_item.pizza_type.price }.sum.to_f
  end
end
