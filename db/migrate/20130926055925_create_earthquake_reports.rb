class CreateEarthquakeReports < ActiveRecord::Migration
  def change
    create_table :earthquake_reports do |t|
      t.integer :source_id
      t.integer :earthquake_id

      t.timestamps
    end
  end
end
