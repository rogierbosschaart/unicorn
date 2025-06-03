class ModelAgencyProfile < ApplicationRecord
  belongs_to :agency
  belongs_to :user
  validates :only_mannquins_belong_to_model_agency_profile

  scope :mannequin, -> { join(:user).where(users: { user_type: 'mannequin'}) }

  private

  def only_mannquins_belong_to_model_agency_profile
    if user_type != 'mannequin' && agency_id.present?
      errors.add(:agency, 'can only be assigned to model-agency-profile if user is mannequin')
    end
  end
end
