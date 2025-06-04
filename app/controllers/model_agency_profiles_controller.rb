class ModelAgencyProfilesController < ApplicationController
  def inbox
    @message_for_display = "MY MESSAGE FOR DISPLAY"
  end

  def travel
    @travels = Travel.all
    @hotels = Hotel.all
  end
end
