class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :bus
  belongs_to :trip
  belongs_to :payment
  has_many :seats, dependent: :destroy 

  validates :total_fare, presence: true

  def total_price
    self.seats.count * self.trip.ticket_price
  end
end
