class Booking < ActiveRecord::Base
  belongs_to :accomodation
  belongs_to :user
  validates :from, presence: :true, numericality: true
  validates :to, presence: :true, numericality: true
end
