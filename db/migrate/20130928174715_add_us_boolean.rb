class AddUsBoolean < ActiveRecord::Migration
  def change
  	add_column :locations, :is_us, :boolean
  	add_column :locations, :place_id, :integer
  	remove_column :locations, :place
  	remove_column :locations, :city
  	add_index :locations,:place_id
  	add_index :locations, :earthquake_id
  end
end
