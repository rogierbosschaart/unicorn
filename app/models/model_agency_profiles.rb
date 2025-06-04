class ModelAgencyProfiles < ApplicationRecord
  belongs_to :agency
  belongs_to :user
  validate :user_must_be_mannequin
  has_many :travels
  has_many :hotels
  has_many :connections

  scope :mannequin, -> { joins(:user).where(users: { user_type: 'mannequin'}) }

  private

  def user_must_be_mannequin
    if user.user_type != 'mannequin' && user.present?
      errors.add(:agency, 'can only be assigned to model-agency-profile if user is mannequin')
    end
  end
end
