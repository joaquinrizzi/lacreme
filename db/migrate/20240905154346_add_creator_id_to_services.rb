class AddCreatorIdToServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :creator_id, :bigint
  end
end
