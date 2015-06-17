class Accomodation < ActiveRecord::Base
  belongs_to :user
  has_many :bookings, dependent: :destroy
  # belongs_to :user, class_name: "Owner", foreign_key: "owner_id"
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :description,
              presence: true
  validates :user_id,
              presence: true,
              numericality: { only_integer: true }
  validates :accomodates,
              presence: true,
              numericality: { only_integer: true }
  validates :night_rate,
              presence: true,
              numericality: { only_integer: true }
  validates :address,
              presence: true
end

# accomodates -> integer
# description -> text
# night_rate -> integer
# address -> string
# owner_id -> integer
# latitude -> float
# longitude -> float