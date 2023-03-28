class TripsController < ApplicationController
  def index
    @trips = Trip.all.order("id")
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end
  
  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:success] = "Trip successfully created"
      redirect_to @trip
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
      if @trip.update(trip_params)
        flash[:success] = "Trip was successfully updated"
        redirect_to trips_url
      else
        flash[:error] = "Something went wrong"
        render :edit, status: :unprocessable_entity
      end
  end
  
  def destroy
    @trip = Trip.find(params[:id])
    if @trip.destroy
      flash[:success] = 'Trip was successfully deleted.'
      redirect_to trips_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to trips_url
    end
  end
  
  private
    def trip_params
      params.require(:trip).permit(:ticket_price, :total_booked, :trip_datetime, :bus_id, :route_id)
    end

end
