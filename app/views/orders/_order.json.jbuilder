json.extract! order, :id, :created_at, :total_price
json.order_items do
  json.array! order.order_items, partial: "order_items/order_item", as: :order_item
end
