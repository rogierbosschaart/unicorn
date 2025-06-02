class CreateModelAgencyProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :model_agency_profiles do |t|
      t.references :agency_id
      t.references :user_id

      t.timestamps
    end
  end
end
