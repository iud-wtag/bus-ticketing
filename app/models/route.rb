class Route < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :route_name, :route_source, :route_destination, presence: true  
  validates :route_name, uniqueness: { message: 'has already been taken' }
end
