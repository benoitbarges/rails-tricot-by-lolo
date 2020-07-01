class MonetizePriceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_monetize :products, :price, currency: { present: false }
    remove_column :products, :price
  end
end
