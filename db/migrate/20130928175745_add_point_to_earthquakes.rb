class AddPointToEarthquakes < ActiveRecord::Migration
  def change
    add_column :earthquakes, :latitude, :decimal, :precision => 10, :scale  => 2
    add_column :earthquakes, :longitude, :decimal, :precision => 10, :scale  => 2 
    add_column :earthquakes, :depth, :decimal, :precision => 10, :scale  => 2
  end
end
