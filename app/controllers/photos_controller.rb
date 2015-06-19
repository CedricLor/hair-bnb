class PhotosController < ApplicationController
  before_action :set_user, only: [:destroy]
  # before_action :set_accomodation, only: [:destroy]

  def new
  end

  def create
    @accomodation = Accomodation.find(params[:accomodation_id])
    @photo = @accomodation.photos.build(photo_params)
    @photo.save
    redirect_to @accomodation
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_path(@user)
    # redirect_to @accomodation
  end

  private

  def photo_params
    params.require(:photo).permit(:picture)
  end

  def set_user
    @user = current_user
  end

  def set_accomodation
    @accomodation = Accomodation.find(params[:id])
  end

end
