class Seat < ApplicationRecord
  belongs_to :bus
  belongs_to :ticket, optional: true

  validates :name, presence:true, format: { without: /\s/, message: "cannot contain spaces" }
end
