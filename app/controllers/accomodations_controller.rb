class AccomodationsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def create
    @accomodation = @user.accomodations.build(accomodations_params)
    @accomodation.save
    redirect_to user_path(@user)
  end

  def new
    @accomodation = Accomodation.new
  end

  def update
    @accomodation = Accomodation.find(params[:id])
    @accomodation.update(accomodations_params)
    redirect_to user_path(@user)
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
end

# accomodates -> integer
# description -> text
# night_rate -> integer
# address -> string
# owner_id -> integer
# latitude -> float
# longitude -> float