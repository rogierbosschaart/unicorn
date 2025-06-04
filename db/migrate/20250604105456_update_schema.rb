class UpdateSchema < ActiveRecord::Migration[7.1]
  def change
    # add_reference :users, :agency, null: true, foreign_key: true
    remove_reference :hotels, :user
    add_reference :hotels, :model_agency_profile, foreign_key: true
    remove_reference :travels, :user
    add_reference :travels, :model_agency_profile, foreign_key: true
    remove_reference :connections, :user
    add_reference :connections, :model_agency_profile, foreign_key: true
  end
end
