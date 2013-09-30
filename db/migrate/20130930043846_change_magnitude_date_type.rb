class ChangeMagnitudeDateType < ActiveRecord::Migration
  def change
    change_column :earthquakes , :magnitude, :decimal, precision: 4, scale:2
  end
end
