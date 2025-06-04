class Travel < ApplicationRecord
  belongs_to :model_agency_profile
  belongs_to :agency
end
