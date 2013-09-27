class ChangeCoordinatesTableName < ActiveRecord::Migration
  def change
    rename_table :coordinates, :locations
    add_column :locations, :place, :string
    add_column :locations, :offset, :integer
  end
end
