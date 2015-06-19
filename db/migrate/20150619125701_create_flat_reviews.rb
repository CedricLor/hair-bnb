class CreateFlatReviews < ActiveRecord::Migration
  def change
    create_table :flat_reviews do |t|
      t.integer :rating
      t.text :content

      t.references :accomodation, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
