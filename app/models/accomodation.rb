class Accomodation < ActiveRecord::Base
  belongs_to :user, dependent: :destroy, counter_cache: true
  # belongs_to :user, dependent: :destroy, counter_cache: true, class_name: "Owner", foreign_key: "owner_id"
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
