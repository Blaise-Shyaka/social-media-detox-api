class ChangeMeasurementsColumnTypes < ActiveRecord::Migration[6.0]
  def change
    change_column :measurements, :twitter, :integer, using: 'twitter::integer'
    change_column :measurements, :instagram, :integer, using: 'instagram::integer'
    change_column :measurements, :tiktok, :integer,using: 'tiktok::integer'
    change_column :measurements, :other, :integer, using: 'other::integer'
    change_column :measurements, :total_time_spent, :integer
    change_column :measurements, :progress, :integer
  end
end
