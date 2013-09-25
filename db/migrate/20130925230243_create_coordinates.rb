class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :depth
      t.integer :earthquake_id

      t.timestamps
    end
  end
end
