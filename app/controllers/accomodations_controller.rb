class AccomodationsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]
  before_action :set_accomodation, only: [:edit , :update, :show]

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
  end

  def index
    @accomodations = Accomodation.all
    @markers = Gmaps4rails.build_markers(@accomodations) do | accomodation, marker |
      marker.lat accomodation.latitude
      marker.lng accomodation.longitude
      marker.infowindow render_to_string(partial: "/accomodations/map_box", locals: { accomodation: accomodation })
    end
  end

  def show
    @accomodation = Accomodation.find(params[:id])
    @booking = Booking.new
    @markers = Gmaps4rails.build_markers(@accomodation) do | accomodation, marker |
      marker.lat accomodation.latitude
      marker.lng accomodation.longitude
      marker.infowindow render_to_string(partial: "/accomodations/map_box", locals: { accomodation: accomodation })
    end
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
    params.require(:accomodation).permit(:accomodates, :description, :night_rate, :address)
  end

  def set_user
    @user = User.find(params[:user_id])
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
