class PicturesController < ApplicationController
  def show
    @pictures = @gallery.pictures
  end

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
  end
end
