class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :bus_name
      t.string :bus_type
      t.string :bus_brand
      t.integer :bus_capacity

      t.timestamps
    end
  end
end
