class AddSelectedToModelAgencyProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :model_agency_profiles, :selected, :boolean, default: false
  end
end
