class ChangeTypeColumnInEarthquakes < ActiveRecord::Migration
  def change
    rename_column :earthquakes, :type, :quake_type
  end
end
