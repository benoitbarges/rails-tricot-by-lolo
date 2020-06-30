class AddCartReferencesToOrderProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_products, :cart, foreign_key: true, null: false
  end
end
