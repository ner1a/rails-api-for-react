class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :quantity
      t.float :price
      t.string :sort

      t.timestamps
    end
  end
end
