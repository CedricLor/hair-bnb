class AccomodationsController < ApplicationController
  def create
    @accomodation = Accomodation.new(accomodations_params)
    @accomodation.accomodates = @accomodation.accomodates.to_i
    @accomodation.night_rate = @accomodation.night_rate.to_i
    @accomodation.user_id = @accomodation.user_id.to_i
    @accomodation.save
    redirect_to accomodations_path
  end

  def new
    @accomodation = Accomodation.new
  end

  def update
    @accomodation = Accomodation.find(params[:id])
    @accomodation.update(accomodations_params)
    redirect_to @accomodation
  end

  def edit
    @accomodation = Accomodation.find(params[:id])
  end

  def index
    @accomodations = Accomodation.all
    @markers = Gmaps4rails.build_markers(@accomodations) do | accomodation, marker |
      marker.lat accomodation.latitude
      marker.lng accomodation.longitude
    end
  end

  def show
    @accomodation = Accomodation.find(params[:id])
  end

  def destroy
  end

  private

  def accomodations_params
    params.require(:accomodation).permit(:accomodates, :description, :night_rate, :address, :user_id)
  end

  def convert_params
    @accomodation.accomodates = @accomodation.accomodates.to_i
    @accomodation.night_rate = @accomodation.night_rate.to_i
    @accomodation.user_id = @accomodation.user_id.to_i
  end
end

# accomodates -> integer
# description -> text
# night_rate -> integer
# address -> string
# owner_id -> integer
# latitude -> float
# longitude -> float