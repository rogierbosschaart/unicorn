class Connection < ApplicationRecord
  belongs_to :model_agency_profiles
  belongs_to :listing
end
