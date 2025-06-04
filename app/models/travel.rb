class Travel < ApplicationRecord
  belongs_to :model_agency_profiles
  belongs_to :agency
end
