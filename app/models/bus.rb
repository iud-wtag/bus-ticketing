class Bus < ApplicationRecord
  validates :name, :typed, :brand, :capacity, presence:true
  validates :capacity, numericality: { only_integer: true, less_than_or_equal_to: 50 }
  validates :name, uniqueness: {message: 'has already been taken'}
  enum typed: { AC: 0, NON_AC: 1 }
end
