class AddTicketReferenceToSeat < ActiveRecord::Migration[7.0]
  def change
    add_reference :seats, :ticket, foreign_key: true
  end
end
