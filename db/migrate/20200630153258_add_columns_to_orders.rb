class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :address1, :string
    add_column :orders, :address2, :string
    add_column :orders, :postcode, :string
    add_column :orders, :city, :string
    add_column :orders, :phone_number, :string
    add_column :orders, :email, :string
  end
end
