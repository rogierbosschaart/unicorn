class HotelsController < ApplicationController
  def create
    @hotel = Hotel.new(hotel_params)
    @agency = current_user.agency
    @hotel.agency = @agency
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :checkin, :checkout, :extra_info, :model_agency_profile_id)
  end
end
