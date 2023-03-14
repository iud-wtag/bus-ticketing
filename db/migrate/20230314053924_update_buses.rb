class UpdateBuses < ActiveRecord::Migration[7.0]
  def change
    change_table :buses do |t|
      t.change :bus_name, :string, default: "", null: false
      t.change :bus_type, :string, default: "", null: false
      t.change :bus_brand, :string, default: "", null: false
      t.change :bus_capacity, :integer, default: 0, null: false
    end
  end
end
