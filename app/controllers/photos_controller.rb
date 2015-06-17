class PhotosController < ApplicationController
  def new
    @accomodation = Accomodation.find(params[:accomodation_id])
    @photo = Photo.new
  end

  def create
    @accomodation = Accomodation.find(params[:accomodation_id])
    @photo = @accomodation.photos.build(photo_params)
    @photo.save
    redirect_to @accomodation
  end

  private

  def photo_params
    params.require(:photo).permit(:picture)
  end

end
