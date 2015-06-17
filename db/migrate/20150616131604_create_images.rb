class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :user, index: true, foreign_key: true
      t.references :accomodation, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
