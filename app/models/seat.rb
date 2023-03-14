class Seat < ApplicationRecord
  belongs_to :bus
  validates :seat_name, :seat_booked, presence:true

end
