class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :listing_type
      t.string :location
      t.string :address
      t.string :photographer
      t.string :stylist

      t.timestamps
    end
  end
end
