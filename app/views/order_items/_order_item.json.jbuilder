json.extract! order_item, :id, :order_id, :pizza_type_id, :quantity, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
json.pizza do
  json.partial! "pizza_types/pizza_type", pizza_type: order_item.pizza_type
end
