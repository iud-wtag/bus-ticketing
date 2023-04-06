class Seat < ApplicationRecord
  belongs_to :bus
  belongs_to :ticket, optional: true

  validates :seat_name, presence:true
end
