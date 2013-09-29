class AddIsUsToPlaces < ActiveRecord::Migration
  def change
    #add_column :places, :is_us, :boolean
    add_column :earthquakes, :place_id, :integer

    add_index :earthquakes, :place_id
  end
end
