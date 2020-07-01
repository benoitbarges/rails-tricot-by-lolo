class MonetizeAmountToOrders < ActiveRecord::Migration[6.0]
  def change
    add_monetize :orders, :amount, currency: { present: false }
    remove_column :orders, :amount
  end
end
