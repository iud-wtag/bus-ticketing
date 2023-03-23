class Bus < ApplicationRecord
  has_many :seats, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_one :trip, dependent: :destroy
  
  validates :bus_name, :bus_type, :bus_brand, :bus_capacity, presence:true
  validates :bus_capacity, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 50 }
end
