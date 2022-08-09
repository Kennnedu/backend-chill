class PizzaType < ApplicationRecord
  validates :name, uniqueness: { scope: :price }
  validates :price, numericality: { greater_than: 0 }
end
