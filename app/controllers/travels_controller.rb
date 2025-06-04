class TravelsController < ApplicationController
  before_action :set_agency

  def index
    @travels = @agency.travels
    @hotels = @agency.hotels
  end


  private

  def set_agency
    @agency = Agency.find(params[:agency_id])
  end
end
