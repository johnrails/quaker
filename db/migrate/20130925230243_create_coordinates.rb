class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.decimal :latitude,precision: 10, :scale =>2
      t.decimal :longitude, precision: 10, :scale =>2
      t.decimal :depth,precision: 10, :scale =>2
      t.integer :earthquake_id

      t.timestamps
    end
  end
end
