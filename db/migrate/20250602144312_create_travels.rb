class CreateTravels < ActiveRecord::Migration[7.1]
  def change
    create_table :travels do |t|
      t.references :user, null: false, foreign_key: true
      t.references :agency, null: false, foreign_key: true
      t.string :origin
      t.string :destination
      t.datetime :date_time

      t.timestamps
    end
  end
end
