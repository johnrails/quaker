class CreateReportProducts < ActiveRecord::Migration
  def change
    create_table :report_products do |t|
      t.integer :product_type_id
      t.integer :earthquake_id

      t.timestamps
    end
  end
end
