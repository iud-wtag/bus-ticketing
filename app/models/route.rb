class Route < ApplicationRecord
  has_many :trips
  validates :route_name, :route_source, :route_destination, presence: true  
  
end
