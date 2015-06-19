class FlatReviewsController < ApplicationController
  before_action :set_user, only: [ :create ]
  before_action :set_accomodation, only: [ :create ]

  def create
    @flat_review = @accomodation.flat_reviews.build(flat_reviews_params)
    @flat_review.user_id = @user.id
    @flat_review.save
    redirect_to accomodation_path(@accomodation)
  end

  private

  def flat_reviews_params
    params.require(:flat_review).permit(:rating, :content)
  end

  def set_user
    @user = current_user
  end

  def set_accomodation
    @accomodation = Accomodation.find(params[:accomodation_id])
  end
end

# accomodates -> integer
# description -> text
# night_rate -> integer
# address -> string
# owner_id -> integer
# latitude -> float
# longitude -> float
