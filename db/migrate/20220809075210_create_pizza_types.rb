class CreatePizzaTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :pizza_types do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
