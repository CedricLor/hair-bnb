class BookingsController < ApplicationController
  before_action :set_user, only: [:create, :update, :destroy]
  before_action :set_accomodation, only: [:create]

  def create
    @booking = @accomodation.bookings.build(renter_booking_params)
    @booking.user_id = @user.id
    @booking.accepted = false
    @booking.save
    redirect_to accomodation_path(@accomodation)
  end

  def new
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update({from: @booking.from, to: @booking.to, accepted: true})
    redirect_to user_path(@user)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def destroy
    if @booking = Booking.find(params[:id])
      if @user.id == @booking.user.id
        @booking.destroy
        flash[:notice] = "The booking request has been rejected!"
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
end
