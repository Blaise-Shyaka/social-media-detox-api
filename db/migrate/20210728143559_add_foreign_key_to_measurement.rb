class AddForeignKeyToMeasurement < ActiveRecord::Migration[6.0]
  def change
    add_column :measurements, :user_id, :integer
  end
end
