class ModelAgencyProfilesController < ApplicationController
  def inbox
    @message_for_display = "MY MESSAGE FOR DISPLAY"
  end

  def travel
    @travels = Travel.where(current_user ==  :model_agency_profile)
    @hotels = Hotel.where(current_user == :model_agency_profile)
  end
end
