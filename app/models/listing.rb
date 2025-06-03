class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :client

  scope :castings, -> { where(listing_type: 'casting') }
  scope :options, -> { where(listing_type: 'option') }
  scope :jobs, -> { where(listing_type: 'job') }

  enum listing_type: { casting: 'casting', option: 'option', job: 'job' }

  # CASTINGS
  validates :start_date, presence: true, if: :casting?
  # validates :start_time, presence: true, if: :casting?
  # validates :end_time, presence: true, if: :casting?
  validates :address, presence: true, if: :casting?

  # OPTIONS
  validates :start_date, presence: true, if: :option?

  # JOBS
  validates :start_date, presence: true, if: :job?
end
