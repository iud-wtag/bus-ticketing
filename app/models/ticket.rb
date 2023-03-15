class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :bus
  belongs_to :trip
  belongs_to :payment
  has_many :seats

  validates :total_fare, presence: true
end
