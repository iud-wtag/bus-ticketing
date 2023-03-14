class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.integer :ticket_price, default: 0, null: false
      t.integer :total_booked, default: 0, null: false
      t.datetime :trip_datetime, null: false
      t.references :bus, null: false, foreign_key: true
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
