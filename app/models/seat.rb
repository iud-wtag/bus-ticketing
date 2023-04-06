class Seat < ApplicationRecord
  belongs_to :bus

  validates :name, presence:true
end
