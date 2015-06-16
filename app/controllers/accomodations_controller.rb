class AccomodationsController < ApplicationController
  def create
  end

  def new
    @accomodation = Accomodation.new
  end

  def update
  end

  def edit
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
end
