class AddOrderReferencesToOrderProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_products, :order, foreign_key: true
  end
end
