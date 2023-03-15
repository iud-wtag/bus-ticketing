class Seat < ApplicationRecord
  belongs_to :bus
  has_one :ticket
  validates :seat_name, presence:true

end
