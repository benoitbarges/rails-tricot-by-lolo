class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :postcode
      t.string :city
      t.string :phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
