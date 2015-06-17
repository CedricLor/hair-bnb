class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    # @user = User.find(params[:id])
    @user_accomodations = @user.accomodations # nesting accomodations OWNED by the user
    @new_user_accomodation = Accomodation.new # adding possibility to user to add
    # a new accomodation directly from its profile page
  end

  def new
  end

  def create
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
