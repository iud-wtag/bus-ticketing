class UpdateTripDateTime2 < ActiveRecord::Migration[7.0]
  def change
    change_table :trips do |t|
      t.datetime :trip_datetime
    end    
  end
end
