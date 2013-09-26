class CreateEarthquakes < ActiveRecord::Migration
  def change
    create_table :earthquakes do |t|
      t.decimal :magnitude, :precision => 10, :scale =>2
      t.string :place
      t.datetime :time
      t.string :url
      t.string :detail_url
      t.integer :felt
      t.decimal :cdi, precision: 10,:scale =>2
      t.decimal :mmi, precision: 10,:scale =>2
      t.string :alert
      t.string :status
      t.integer :tsumani
      t.integer :sig
      t.string :code
      t.integer :nst
      t.decimal :dmin,precision: 10, :scale =>2
      t.decimal :gap, precision: 10,:scale =>2
      t.string :mag_type
      t.string :type

      t.timestamps
    end
  end
end
