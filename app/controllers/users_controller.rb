class UsersController < ApplicationController
  #def user_params
  #  params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
  #end

  #def new
  #  @user = User.new
  #end

  #def create
  #  user_params
  #end

  def show
    @user = current_user
  end

  def index
    @users = User.all
  end

end
