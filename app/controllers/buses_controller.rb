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
      create_seats_for_bus(@bus, @bus.capacity)
      flash[:success] = "Bus was successfully Created"
      redirect_to @bus
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
        @bus.seats.destroy_all
        create_seats_for_bus(@bus, @bus.capacity)
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
    def create_seats_for_bus(bus, capacity)
      @columns = 4
      @seats = []
      count = 0
      ('A'..'Z').each do |row|
        (1..@columns).each do |column|
          if count == capacity
            break
          @seats << Seat.create(name: row + column.to_s, bus: bus)
          count += 1
          end
        end 
        if count == capacity
          break
        end
      end 
    end

    def bus_params
      params.require(:bus).permit(:name, :typed, :brand, :capacity)
    end 

end
