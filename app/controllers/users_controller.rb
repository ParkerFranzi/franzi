class UsersController < ApplicationController

  def index
    @users = User.all
    authorize! :edit, @user, message: "You need permission to view the user list."
  end

  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user, message: "You need to be an admin to delete users."
    if @user.destroy
      flash[:notice] = "User was deleted successfully."
      redirect_to users_path
    else
      flash[:error] = "There was an error deleting the user."
      redirect_to users_path
    end
  end

  def update
    @user = User.find params[:id]
    authorize! :edit, @user, message: "You need to be an admin to update users."

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@user) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@user) }
      end
    end
  end
end