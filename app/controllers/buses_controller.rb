class BusesController < ApplicationController
  def index
    @buses = Bus.all.order("id")
  end
  
  def show
    @bus = Bus.find(params[:id])
  end

  def new
    @bus = Bus.new
  end
  
  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      @columns = 4
      @seats = []
      bus_capacity = @bus.bus_capacity
      count = 0
      ('A'..'Z').each do |row|
        (1..@columns).each do |column|
          @seats << Seat.create(seat_name: row+column.to_s, bus: @bus)
          bus_capacity-=1
          if bus_capacity==0
            break
          end
        end 
        if bus_capacity==0
          break
        end
      end 
      flash[:success] = "Bus successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def update
    @bus = Bus.find(params[:id])
      if @bus.update(bus_params)
        flash[:success] = "Bus was successfully updated"
        redirect_to @bus
      else
        flash[:error] = "Something went wrong"
        render :edit, status: :unprocessable_entity
      end
  end
  
  def destroy
    @bus = Bus.find(params[:id])
    if @bus.destroy
      flash[:success] = 'Bus was successfully deleted.'
      redirect_to @bus, status: :see_other
    else
      flash[:error] = 'Something went wrong'
      redirect_to buss_url
    end
  end
  
  private
    def bus_params
      params.require(:bus).permit(:bus_name, :bus_type, :bus_brand, :bus_capacity)
    end 

end
