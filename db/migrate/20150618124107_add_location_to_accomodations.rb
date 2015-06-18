class AddLocationToAccomodations < ActiveRecord::Migration
  def change
    add_column :accomodations, :street_number, :string
    add_column :accomodations, :route, :string
    add_column :accomodations, :locality, :string
    add_column :accomodations, :country, :string
  end
end
