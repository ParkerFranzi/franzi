class GallerysController < ApplicationController
  def index
    @gallerys = Gallery.paginate(page: params[:page], per_page: 10)
  end

  def new
    @gallery = Gallery.new
    @pictures = @gallery.pictures
    @picture = Picture.new
    authorize! :read, Gallery
  end

  def show
  end

  def edit
  end
end
