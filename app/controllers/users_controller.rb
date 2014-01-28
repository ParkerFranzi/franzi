class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User was deleted successfully."
      redirect_to users_path
    else
      flash[:error] = "There was an error deleting the user."
      redirect_to users_path
    end
  end
end