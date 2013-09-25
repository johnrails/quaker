class CreateEarthquakes < ActiveRecord::Migration
  def change
    create_table :earthquakes do |t|
      t.decimal :magnitude
      t.string :place
      t.datetime :time
      t.string :url
      t.string :detail_url
      t.integer :felt
      t.decimal :cdi
      t.decimal :mmi
      t.string :alert
      t.string :status
      t.integer :tsumani
      t.integer :sig
      t.string :code
      t.integer :nst
      t.decimal :dmin
      t.decimal :gap
      t.string :mag_type
      t.string :type

      t.timestamps
    end
  end
end
