class Bus < ApplicationRecord
  validates :bus_name, :bus_type, :bus_brand, :bus_capacity, presence:true
  validates :bus_capacity, numericality: { only_integer: true }
end
