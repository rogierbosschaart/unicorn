class DeleteColumnsFromModelAgencyProfile < ActiveRecord::Migration[7.1]
  def change
    remove_column :model_agency_profiles, :agency_id_id, :bigint
    remove_column :model_agency_profiles, :user_id_id, :bigint
    add_reference :model_agency_profiles, :agency, foreign_key: true
    add_reference :model_agency_profiles, :user, foreign_key: true
  end
end
