class RemoveShapeFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :shape, :string
  end
end
