class AddUserIdToFlatReviews < ActiveRecord::Migration
  def change
    add_reference :flat_reviews, :user, index: true, foreign_key: true
  end
end
