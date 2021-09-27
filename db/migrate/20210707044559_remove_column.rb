class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :measurements, :platform
    remove_column :measurements, :time_spent
  end
end
