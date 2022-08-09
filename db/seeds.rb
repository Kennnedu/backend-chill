pizzes = FactoryBot.create_list(:pizza_type, rand(10..25))

FactoryBot.create_list(:order, rand(100..200)).each do |order|
  FactoryBot.create_list(:order_item, rand(2..10), order: order, pizza_type: pizzes.sample)
end

