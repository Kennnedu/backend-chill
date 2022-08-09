pizzes = FactoryBot.create_list(:pizza_type, rand(10..25))

FactoryBot.create_list(:order, rand(100..200)).each do |order|
  Array.new(rand(2..10)) { FactoryBot.create(:order_item, order: order, pizza_type: pizzes.sample)  }
end

