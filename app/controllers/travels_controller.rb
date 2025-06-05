class TravelsController < ApplicationController
  def create
    @travel = Travel.new(travel_params)
    @agency = current_user.agency
    @travel.agency = @agency
  end

  private

  def travel_params
    params.require(:travel).permit(:origin, :destination, :date, :time, :extra_info, :model_agency_profile_id)
  end
end
