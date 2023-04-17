class UsersController < ApplicationController
  
  def index
    @users = User.all.order("id")
  end

  def profile
    @user = current_user
    @tickets = Ticket.where(user: @user)
  end

  def show
    @user = User.find(params[:id])
    @tickets = Ticket.where(user: @user)
  end  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to sign_in_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User was successfully updated"
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = 'User was successfully deleted.'
      redirect_to @user, status: :see_other
    else
      flash[:error] = 'Something went wrong'
      redirect_to users_url
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone, :user_name, :role)
    end
end
