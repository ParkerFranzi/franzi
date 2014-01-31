class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.paginate(page: params[:page], per_page: 10)
    authorize! :read, Gallery, message: "You need to be a member to view galleries."
  end

  def new
    @gallery = Gallery.new
    authorize! :read, Gallery
  end

  def create
    @gallery = current_user.galleries.build(params[:gallery])
    authorize! :create, Gallery, message: "You need to be an admin to create a gallery."
    if @gallery.save
      flash[:notice] = "Gallery was saved."
      redirect_to @gallery
    else
      flash[:error] = "There was an error saving the gallery. Please try again."
      render :new
    end
  end

  def show
    @gallery = Gallery.find(params[:id])

    @picture = Picture.new
    authorize! :read, Gallery, message: "You need to be a confirmed friend/family member to view Galleries."
  end

  def edit
    @gallery = Gallery.find(params[:id])
    authorize! :edit, @gallery, message: "You need to own the post to edit it."
  end

  def update
    @gallery = Gallery.find(params[:id])
    authorize! :update, @gallery, message: "You need to own the gallery to edit it."
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Gallery was updated."
      redirect_to @gallery
    else
      flash[:error] = "There was an error saving the gallery. Please try again."
      render :edit
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    
    title = @gallery.title
    authorize! :destroy, @gallery, message: "You need to own the gallery to destroy it."
    if @gallery.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @gallery
    else
      flash[:error] = "There was an error deleting the gallery."
      render :show
    end
  end
end
