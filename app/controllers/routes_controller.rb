class RoutesController < ApplicationController
  def index
    @routes = Route.all.order("id")
  end

  def show
    @route = Route.find(params[:id])
  end  

  def new
    @route = Route.new
  end
  
  def create
    @route = Route.new(route_params)
    if @route.save
      flash[:success] = "Route was successfully Created"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])
      if @route.update(route_params)
        flash[:success] = "Route was successfully updated"
        redirect_to @route
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @route = Route.find(params[:id])
    if @route.destroy
      flash[:success] = 'Route was successfully deleted.'
      redirect_to root_path, status: :see_other
    else
      flash[:error] = 'Something went wrong'
      redirect_to routes_url
    end
  end

  private
    def route_params
      params.require(:route).permit(:route_name, :route_destination, :route_source)
    end 
  
end
