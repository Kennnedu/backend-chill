require "test_helper"

class OrderItemTest < ActiveSupport::TestCase
  def setup
    @order = FactoryBot.create(:order)
    @pizza_type = FactoryBot.create(:pizza_type)
  end

  test "valid order item" do
    order_item = OrderItem.new(order: @order, pizza_type: @pizza_type, quantity: 4)
    assert order_item.valid?
  end

  test "quantity equal 0" do
    order_item = OrderItem.new(order: @order, pizza_type: @pizza_type, quantity: 0)
    order_item.save
    assert order_item.invalid?
    assert order_item.errors.key?(:quantity)
  end
end
