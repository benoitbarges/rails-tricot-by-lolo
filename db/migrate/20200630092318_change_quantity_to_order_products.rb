class ChangeQuantityToOrderProducts < ActiveRecord::Migration[6.0]
  def change
    change_column_default :order_products, :quantity, from: nil, to: 1
  end
end
