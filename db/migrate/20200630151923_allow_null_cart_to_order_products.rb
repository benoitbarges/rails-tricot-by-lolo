class AllowNullCartToOrderProducts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :order_products, :cart_id, true
  end
end
