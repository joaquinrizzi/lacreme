class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.text :description
      t.string :shape, null: false

      t.timestamps
    end
  end
end
