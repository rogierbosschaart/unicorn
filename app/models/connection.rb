class Connection < ApplicationRecord
  belongs_to :model_agency_profile
  belongs_to :listing
  belongs_to :agency
end
