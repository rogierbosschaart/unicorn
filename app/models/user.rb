class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: { mannequin: 'mannequin', agent: 'agent' }

  scope :agents, -> { where(user_type: 'agent') }
  scope :mannequins, -> { where(user_type: 'mannequin') }

  belongs_to :agency, optional: true
  # validate :only_agents_belong_to_agency

  has_many :model_agency_profiles
  has_many :listings
  has_many :model_agency_profiles, dependent: :destroy
  has_many :connection_comments

  # private

  # def only_agents_belong_to_agency
  #   if user_type != 'agent'
  #     errors.add(:agency, 'can only be assigned to agency if user is agent')
  #   end
  # end

end
