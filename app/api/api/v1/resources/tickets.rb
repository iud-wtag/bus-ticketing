module V1
  module Resources
    class Tickets < Grape::API
      helpers Devise::Controllers::Helpers

      resource :tickets do
        desc 'Returning all the tickets'
        get do
          Ticket.all
        end

        desc "Creating a ticket"
        post do
          @seats = params[:seats].split(',')
          @trip = Trip.find_by(id: params[:trip_id])
          @payment = Payment.create
          @total = @seats.size * @trip.ticket_price
          @user = current_user

          @ticket = Ticket.create!(total_fare: @total, user: @user, trip: @trip, bus: @trip.bus, payment: @payment)

          for i in @seats
            seat = @trip.bus.seats.find_by(name: i)
            seat.update(booked: true, ticket: @ticket)
          end  

          @trip.update(total_booked: @trip.total_booked + @seats.size)

        end  
      end
    end
  end
end
