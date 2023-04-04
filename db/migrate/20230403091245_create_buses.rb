class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :bus_name, null: false
      t.string :bus_type, null: false
      t.string :bus_brand, null: false
      t.integer :bus_capacity, default:0, null: false
      t.timestamps
    end

    add_index :buses, :bus_name, unique: true
  end
end
