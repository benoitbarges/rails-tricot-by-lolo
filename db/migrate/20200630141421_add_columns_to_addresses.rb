class AddColumnsToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :first_name, :string
    add_column :addresses, :last_name, :string
    add_column :addresses, :email, :string
  end
end
