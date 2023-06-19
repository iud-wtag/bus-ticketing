class Trip < ApplicationRecord
  belongs_to :bus
  belongs_to :route

  validates :ticket_price, :total_booked, :trip_datetime, presence:true
end
