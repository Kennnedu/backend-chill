FactoryBot.define do
  factory :pizza_type do
    name { Faker::Food.dish }
    price { Faker::Commerce.price }
  end
end
