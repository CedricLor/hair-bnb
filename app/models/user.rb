class User < ActiveRecord::Base
  has_many :accomodations, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
