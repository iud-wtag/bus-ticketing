class Seat < ApplicationRecord
  belongs_to :bus
  belongs_to :ticket
  validates :seat_name, :seat_booked, presence:true

end
