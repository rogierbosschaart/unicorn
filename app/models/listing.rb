class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :client

  scope :castings, -> { where(listing_type: 'casting') }
  scope :options, -> { where(listing_type: 'option') }
  scope :jobs, -> { where(listing_type: 'job') }

  enum listing_type: { casting: 'casting', option: 'option', job: 'jpb' }

  if listing_type == 'casting'
    validates :address, presence: true
  end
end
