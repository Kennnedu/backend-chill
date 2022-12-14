FactoryBot.define do
  factory :pizza_type do
    name { Faker::Food.dish }
    price { Faker::Commerce.price(range: 1.0..10.0) }
  end
end
