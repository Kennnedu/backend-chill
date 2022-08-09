FactoryBot.define do
  factory :order_item do
    order
    pizza_type
    quantity { rand(1..5) }
  end
end
