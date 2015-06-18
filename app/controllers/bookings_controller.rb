class BookingsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_accomodation, only: [:create]

  def create
    @booking = @accomodation.bookings.build(renter_booking_params)
    @booking.save
    redirect_to user_accomodation_path(@user, @accomodation)
    # current_account.bookings.create
    # account = Account.new(params[:account_id])
    # account.bookings.create
  end

  def new
  end

  def update
  end

  def edit
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
    @user = User.find(params[:user_id])
  end

  def set_accomodation
    @accomodation = Accomodation.find(params[:accomodation_id])
  end
end
