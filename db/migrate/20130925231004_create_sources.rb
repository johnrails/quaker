class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :code

      t.timestamps
    end
  end
end
