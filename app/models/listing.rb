class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :client
end
