class Bus < ApplicationRecord
  has_many :seats
  has_many :tickets
  has_one :trip
  
  validates :bus_name, :bus_type, :bus_brand, :bus_capacity, presence:true
  validates :bus_capacity, numericality: { only_integer: true }
end
