class UpdateTripDateTime < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :trip_datetime
    change_table :trips do |t|
      t.date :bus_date
      t.time :bus_time
    end  
  end
end
