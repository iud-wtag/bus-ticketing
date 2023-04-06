class Seat < ApplicationRecord
  belongs_to :bus

  validates :name, presence:true, format: { without: /\s/, message: "cannot contain spaces" }
end
