class CreateAccomodations < ActiveRecord::Migration
  def change
    create_table :accomodations do |t|
      t.integer :accomodates
      t.text :description
      t.integer :night_rate
      t.string :address
      t.references :user, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
