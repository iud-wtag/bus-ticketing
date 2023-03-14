class Route < ApplicationRecord
  validates :route_name, :route_source, :route_destination, presence: true  
  
end
