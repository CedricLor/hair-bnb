class Booking < ActiveRecord::Base
  belongs_to :accomodation
  belongs_to :user
  validates :from, presence: :true
  validates :to, presence: :true
  # validates :from, presence: :true, numericality: true
  # validates :to, presence: :true, numericality: true

  validate :start_date_before_end_date
  validate :start_date_cannot_be_in_the_past

  def self.find_bookings_for_user(current_user_id)
    Booking.where("user_id = #{current_user_id}")
  end

  def start_date_before_end_date
    if from > to
      errors.add(:from, "You cannot check out before you check in, you hairy idiot!")
    end
  end

  def start_date_cannot_be_in_the_past
    if from < Date.today
      errors.add(:from, "You cannot book in the past, you hairy idiot!")
    end
  end
end
