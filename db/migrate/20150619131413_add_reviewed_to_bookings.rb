class AddReviewedToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :reviewed, :boolean, default: false
  end
end
