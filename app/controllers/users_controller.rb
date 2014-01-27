class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @users = User.all
    if @user.destroy
      flash[:notice] = "was deleted successfully."
      render :show
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end
end