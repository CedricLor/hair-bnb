class Booking < ActiveRecord::Base
  belongs_to :accomodation
  belongs_to :user
  validates :from, presence: :true, numericality: true
  validates :to, presence: :true, numericality: true
  validates :accepted, presence: :true, inclusion: { in: [true, false] }
end


#   t.datetime "from"
#   t.datetime "to"
#   t.boolean  "accepted"
