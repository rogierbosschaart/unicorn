class Agency < ApplicationRecord
  has_many :users
  has_many :agents, -> { where(user_type: 'agent') }, class_name: "Users"
  has_many :model_agency_profiles

  has_many :mannequins, through: :model_agency_profiles, source: :user
end
