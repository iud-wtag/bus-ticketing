class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all.order("id")
  end
end
