class ModelAgencyProfileController < ApplicationController
  belongs_to :user
  belongs_to :agency
end
