class Route < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, :source, :destination, presence: true, format: { without: /\d/ }
  validates :name, uniqueness: { message: 'has already been taken' }
end
