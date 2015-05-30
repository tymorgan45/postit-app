class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :user_same_as_profile , only: [:edit, :update]

  def index
  end

  def show
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You have been registered."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You have successfully updated your profile."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def set_user
    @user = User.find(params[:id])  
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end