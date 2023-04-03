class Bus < ApplicationRecord
  validates :bus_name, :bus_type, :bus_brand, :bus_capacity, presence:true
  validates :bus_capacity, numericality: { only_integer: true }
  validates :bus_name, uniqueness: {message: 'has already been taken'}
end