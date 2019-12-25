class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :name_station_line
      t.string :name_station
      t.string :walk_minutes
      t.timestamps
    end
  end
end
