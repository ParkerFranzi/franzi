class PicturesController < ApplicationController
  # def show
  #   @picture = Picture.find(params[:id])
  #   @pictures = @gallery.pictures
  # end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @picture = Picture.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])


    @picture = current_user.pictures.build(params[:picture])
    @picture.gallery = @gallery

    authorize! :create, @picture, message: "You need to be signed in to do that."
    if @picture.save
      flash[:notice] = "Picture was created."
      redirect_to [@gallery]
    else
      flash[:error] = "There was an error saving the picture. Please try again."
      render 'galleries/show'
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def destroy
    @gallery = Gallery.find(params[:gallery_id])
    
    @picture = @gallery.pictures.find(params[:id])

    authorize! :destroy, @picture, message: "You need to own the picture to destroy it."
    if @picture.destroy
      flash[:notice] = "Picture was deleted successfully."
      redirect_to @gallery
    else
      flash[:error] = "There was an error deleting the post."
      redirect_to @gallery
    end
  end
end
