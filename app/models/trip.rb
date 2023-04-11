class Trip < ApplicationRecord
  belongs_to :bus
  belongs_to :route
  has_many :tickets, dependent: :destroy

  validates :ticket_price, :total_booked, :trip_datetime, presence:true

  validates :ticket_price, numericality: { only_integer: true }
end
