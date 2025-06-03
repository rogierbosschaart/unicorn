class Agency < ApplicationRecord
  # has_many :users
  has_many :agents, -> { where(user_type: :agent) },
           class_name: "User",
           foreign_key: "agency_id",
           inverse_of: :agency
  has_many :model_agency_profiles
  has_many :mannequins, through: :model_agency_profiles, source: :user
  has_many :hotels
  has_many :travels
end
