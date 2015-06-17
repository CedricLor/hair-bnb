class User < ActiveRecord::Base
  has_many :accomodations, dependent: :destroy
end
