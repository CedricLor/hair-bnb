class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user_owned_accomodations = @user.accomodations # nesting accomodations OWNED by the user
    @new_user_accomodation = Accomodation.new # adding possibility to user to add
    # a new accomodation directly from its profile page
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description, :picture)
  end

  def set_user
    @user = current_user
  end
end
