class TicketsController < ApplicationController
  before_action :depend_params, only: %i[select_trip]
  before_action :authenticate_user!, only: %i[confirm_order]

  def index
    @tickets = Ticket.all.order("id")
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def select_trip
    @sources = Route.select('DISTINCT ON (source) *')
    @destinations = @destination || []
    @trips = @trip || []
  end

  def select_seat
    @trip = Trip.find_by(id: params[:id])
    @bus = Bus.find_by(id: @trip.bus.id)
    @seats = @bus.seats.order(name: :asc)
  end  

  def payment
    @seats = []
    params.each do |key,value|
      @seats.push(value) if key == value
    end  
    if @seats.size==0
      flash[:alert] = 'Select at least 1 seat'
      redirect_to select_seat_path(params[:trip_id]), status: :see_other
    else
      @seat_session = session[:seats] || []
      session[:seats] = @seats
      session[:trip] = params[:trip_id]
      redirect_to show_payment_path, status: :see_other
    end
  end

  def show_payment
    @seats = session[:seats]
    @trip = Trip.find_by(id: session[:trip])
    @total = @trip.ticket_price * session[:seats].size
  end

  def confirm_order
    @seats = session[:seats]
    @trip = Trip.find_by(id: session[:trip])
    @payment = Payment.create
    @total = @seats.size * @trip.ticket_price
    @ticket = Ticket.new(total_fare: @total, user: current_user, trip: @trip, bus: @trip.bus, payment: @payment)
    
    for i in @seats
      seat = @trip.bus.seats.find_by(id: i)
      if seat.booked == true
        flash[:alert] = "Seat already Booked!"
        return redirect_to action: 'select_trip', status: :see_other
      end  
    end
    
    if @ticket.save
      for i in @seats
        seat = @trip.bus.seats.find_by(id: i)
        seat.update(booked: true, ticket: @ticket)
      end
      @trip.update(total_booked: @trip.total_booked + @seats.size)
      
      flash[:notice] = 'Successfully booked'
      redirect_to profile_path, status: :see_other

    else
      flash[:alert] = "Booking Failed"
      redirect_to action: 'select_trip', status: :see_other
    end  
  end  

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.seats.each do |seat|
      Seat.create(name: seat.name, bus: @ticket.bus)
    end  
    if @ticket.destroy
      flash[:success] = 'Ticket was successfully deleted.'
      redirect_to tickets_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to tickets_url
    end
  end
  
  private
    def ticket_params
      params.require(:ticket).permit(:total_fare, :user_id, :bus_id, :trip_id, :payment_id)
    end

    def depend_params
      @source = Route.find_by(id: params[:source].presence)
      @destination = Route.where(source: params[:source].presence)
      if params[:trip_datetime].present?
        trip_date = DateTime.parse(params[:trip_datetime]).to_date
        @trip = Trip.where(trip_datetime: trip_date.beginning_of_day..trip_date.end_of_day,
          route: Route.find_by(source: params[:source].presence,destination: params[:destination].presence ))
      end
    end  
  
end
