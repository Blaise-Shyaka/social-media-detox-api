class AddColumnsToMeasurements < ActiveRecord::Migration[6.0]
  def change
    add_column :measurements, :twitter, :string
    add_column :measurements, :instagram, :string
    add_column :measurements, :tiktok, :string
    add_column :measurements, :other, :string
    add_column :measurements, :total_time_spent, :integer
    add_column :measurements, :progress, :integer
  end
end
