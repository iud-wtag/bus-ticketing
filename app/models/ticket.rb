class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :bus
  belongs_to :seat
  belongs_to :trip
  belongs_to :payment

  validates :total_fare, presence: true
end
