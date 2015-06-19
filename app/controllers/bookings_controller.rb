class BookingsController < ApplicationController
  before_action :set_user, only: [:create, :update, :destroy]
  before_action :set_accomodation, only: [:create]
  before_action :set_booking, only: [:edit, :update]

  def create
    @booking = @accomodation.bookings.build(renter_booking_params)
    @booking.user_id = @user.id
    @booking.accepted = false
    @booking.reviewed = false
    @booking.save
    redirect_to accomodation_path(@accomodation)
  end

  def new
  end

  def edit
  end

  def update
    if update_params["accepted"] == "1" # TO DO: DISCUSS WITH SIMON
      @booking.update({from: @booking.from, to: @booking.to, accepted: true, reviewed: true})
      flash[:notice] = "The booking request has been accepted!"
    else
      @booking.update({from: @booking.from, to: @booking.to, accepted: false, reviewed: true})
      flash[:notice] = "The booking request has been rejected!"
    end
    redirect_to user_path(@user)
  end

  def destroy
    if @booking = Booking.find(params[:id])
      if @user.id == @booking.user.id
        @booking.destroy
        flash[:notice] = "The booking request has been deleted!"
        redirect_to user_path(@user)
      else
        flash[:alert] = "You do not have the right to reject this booking request!"
        redirect_to user_path(@user)
      end
    else
      flash[:alert] = "The booking that you are trying to delete has already been delete. Refresh your navigator!"
      redirect_to user_path(@user)
    end
  end

  def index
  end

  def show
  end

  private

  def update_params
    params.require(:booking).permit(:accepted)
  end

  def renter_booking_params
    params.require(:booking).permit(:from, :to)
  end

  def set_user
    @user = current_user
    # @user = User.find(params[:user_id])
  end

  def set_accomodation
    @accomodation = Accomodation.find(params[:accomodation_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
