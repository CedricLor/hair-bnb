class BookingsController < ApplicationController
  before_action :set_user, only: [:create, :update]
  before_action :set_accomodation, only: [:create]

  def create
    @booking = @accomodation.bookings.build(renter_booking_params)
    @booking.user_id = @user.id
    @booking.save
    redirect_to accomodation_path(@accomodation)
    # current_account.bookings.create
    # account = Account.new(params[:account_id])
    # account.bookings.create
  end

  def new
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(accepted: true)
    redirect_to user_path(@user)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def destroy
  end

  def index
  end

  def show
  end

  private

  def renter_booking_params
    params.require(:booking).permit(:from, :to, :user_id)
  end

  def owner_booking_params
    params.require(:booking).permit(:accepted)
  end

  # insecure methods - To be redrafted with Devise
  def set_user
    @user = current_user
    # @user = User.find(params[:user_id])
  end

  def set_accomodation
    @accomodation = Accomodation.find(params[:accomodation_id])
  end
end
