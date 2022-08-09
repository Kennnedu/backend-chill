class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :pizza_type

  validates :quantity, numericality: { greater_than: 0 }
end
