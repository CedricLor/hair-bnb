class FlatReview < ActiveRecord::Base
  belongs_to :accomodation
  belongs_to :user
  validates :content,
              presence: true
  validates :rating,
              presence: true,
              numericality: { only_integer: true }
end
