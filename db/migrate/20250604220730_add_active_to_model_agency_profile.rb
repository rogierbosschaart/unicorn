class AddActiveToModelAgencyProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :model_agency_profiles, :active, :boolean, default: false
  end
end
