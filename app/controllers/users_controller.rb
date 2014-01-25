class UsersController < ApplicationController

  def show
    @users = User.find(params[:id])
    @users = User.all
  end
end