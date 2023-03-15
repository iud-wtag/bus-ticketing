class RemoveSeatFromTickets < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tickets, :seat, null: false, foreign_key: true
  end
end
