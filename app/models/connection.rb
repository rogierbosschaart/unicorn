class Connection < ApplicationRecord
  belongs_to :model_agency_profile
  belongs_to :listing
  delegate :agency, to: :model_agency_profile, allow_nil: true
  has_many :connection_comments, dependent: :destroy
#   belongs_to :agency
end
