require "test_helper"

class PizzaTypeTest < ActiveSupport::TestCase
  def setup
    @pizza_type = FactoryBot.create(:pizza_type)
  end

  test "valid pizza type" do
    pizza_type = FactoryBot.build(:pizza_type)
    assert pizza_type.valid?
  end

  test "price equal 0" do
    pizza_type = FactoryBot.build(:pizza_type, price: 0)
    pizza_type.save
    assert pizza_type.invalid?
    assert pizza_type.errors.key?(:price)
  end

  test "duplicate name" do
    pizza_type = FactoryBot.create(:pizza_type, name: @pizza_type.name)
    assert pizza_type.valid?
  end

  test "duplicate name and price" do
    pizza_type = PizzaType.create(@pizza_type.as_json(only: %i[name price]))
    assert pizza_type.invalid?
    assert pizza_type.errors.key?(:name)
  end
end
