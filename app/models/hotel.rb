class Hotel < ApplicationRecord
  belongs_to :agency
  belongs_to :model_agency_profile
end
