class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.string :platform
      t.integer :time_spent

      t.timestamps
    end
  end
end
