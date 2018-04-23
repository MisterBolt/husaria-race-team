class UsersController < ApplicationController
  before_action :correct_user,        only: [:edit, :update]
  before_action :require_admin_user,  only: [:new, :create, :destroy, :make_admin]

  def new
    @user = User.new
  end

  def index
    @users = User.order(:surname).paginate(page: params[:page], per_page: 20)
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.order(:start).paginate(page: params[:page], per_page: 10)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "New user created"
      redirect_to edit_user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def make_admin
    @user = User.find(params[:id])
    if @user.update_attribute(:admin, 1)
      flash[:success] = @user.name + " " + @user.surname + " has got admin privileges now"
    else
      flash[:danger] = @user.name + " " + @user.surname + " already is an admin"
    end
    redirect_to user_path(@user)
  end

  private

    def user_params
      params.require(:user).permit(:name, :surname, :email, :sex,
                                   :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user) || current_user.admin?
    end
end
