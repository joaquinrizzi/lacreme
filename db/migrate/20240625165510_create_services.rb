class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :description
      t.float :price, null: false
      t.integer :duration

      t.timestamps
    end
  end
end
