class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :size
      t.text :description
      t.boolean :available
      t.string :category

      t.timestamps
    end
  end
end
