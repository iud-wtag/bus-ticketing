class Bus < ApplicationRecord
  has_many :seats, dependent: :destroy
  has_one :trip, dependent: :destroy
  
  validates :name, :typed, :brand, :capacity, presence:true
  validates :capacity, numericality: { only_integer: true, less_than_or_equal_to: 50 }
  validates :name, uniqueness: { message: 'has already been taken' }, format: { without: /\s/, message: "cannot contain spaces" }
  validates :brand, format: { without: /\d/, message: "cannot contain digits" }

  enum typed: { AC: 0, NON_AC: 1 }
end
