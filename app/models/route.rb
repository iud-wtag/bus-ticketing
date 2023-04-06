class Route < ApplicationRecord
  validates :name, :source, :destination, presence: true, format: { without: /\d/ }
  validates :name, uniqueness: { message: 'has already been taken' }
end
