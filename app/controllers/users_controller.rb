class UsersController < ApplicationController
  before_action :find_user_by_id, only: %i[edit udpate]
  def index
    @users = User.all.order("id")
  end

  def show
    @user = current_user
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
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User was successfully updated"
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
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

    def find_user_by_id
      @user = User.find(params[:id])
    end
end
