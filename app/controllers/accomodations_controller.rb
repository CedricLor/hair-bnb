class AccomodationsController < ApplicationController
  before_action :set_user, only: [:show, :create, :destroy]
  before_action :set_accomodation, only: [:show, :edit, :update, :destroy]

  def create
    @accomodation = @user.accomodations.build(accomodations_params)
    @accomodation.save
    redirect_to user_path(@user)
  end

  def new
    @accomodation = Accomodation.new
  end

  def update
    @accomodation.update(accomodations_params)
    redirect_to @accomodation
  end

  def edit
    @accomodation = Accomodation.find(params[:id])
  end

  def index
    if params[:search]
      @accomodations = Accomodation.where(locality: params[:search]).order("night_rate ASC")
    else
      @accomodations = Accomodation.all.order("night_rate ASC")
    end
    @markers = Gmaps4rails.build_markers(@accomodations) do | accomodation, marker |
      marker.lat accomodation.latitude
      marker.lng accomodation.longitude
      marker.infowindow render_to_string(partial: "/accomodations/map_box", locals: { accomodation: accomodation })
    end
  end

  def show
    @booking = Booking.new
    @owner = @accomodation.user
    @accomodation_bookings = @accomodation.bookings
    @markers = Gmaps4rails.build_markers(@accomodation) do | accomodation, marker |
      marker.lat accomodation.latitude
      marker.lng accomodation.longitude
    end
    @new_flat_review = FlatReview.new
  end

  def destroy
    if Accomodation.find(params[:id])
      @accomodation = Accomodation.find(params[:id])
      @accomodation.destroy
      redirect_to user_path(@user)
    else
      flash[:alert] = "The accomodation that you are trying to delete has already been delete. Refresh your navigator!"
      redirect_to user_path(@user)
    end
  end

  private

  def accomodations_params
    params.require(:accomodation).permit(:accomodates, :description, :night_rate, :address, :locality, :street_number, :country, :route)
  end

  def set_user
    @user = current_user
  end

  def set_accomodation
    @accomodation = Accomodation.find(params[:id])
  end
end

# accomodates -> integer
# description -> text
# night_rate -> integer
# address -> string
# owner_id -> integer
# latitude -> float
# longitude -> float
