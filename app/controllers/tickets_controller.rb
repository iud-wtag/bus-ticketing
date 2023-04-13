class TicketsController < ApplicationController
  before_action :depend_params, only: %i[select_trip]

  def index
    @tickets = Ticket.all.order("id")
  end

  def select_trip
    @sources = Route.select('DISTINCT ON (source) *')
    @destinations = @destination || []
    @trips = @trip || []
  end

  def select_seat
    @trip = Trip.find_by(id: params[:id])
    @bus = Bus.find_by(id: @trip.bus.id)
    @seats = @bus.seats.order(id: :asc)
  end  

  def confirm_order
    
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
      redirect_to confirm_order, status: :see_other
    end
  end
  
  private
    def ticket_params
      params.require(:ticket).permit(:total_fare, :user_id, :bus_id, :trip_id, :payment_id)
    end

    def depend_params
      @source = Route.find_by(id: params[:source].presence)
      @destination = Route.where(source: params[:source].presence)
      trip_date = DateTime.parse(params[:trip_datetime]).to_date
      @trip = Trip.where(trip_datetime: trip_date.beginning_of_day..trip_date.end_of_day,
                         route: Route.find_by(source: params[:source].presence,
                                              destination: params[:destination].presence ))
    end  
  
end
