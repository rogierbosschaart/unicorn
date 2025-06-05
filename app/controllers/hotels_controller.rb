class HotelsController < ApplicationController
  def new
    @agency = Agency.find(params[:agency_id])
    @hotel = Hotel.new
  end

  def create
    @agency = Agency.find(params[:agency_id])
    @hotel = Hotel.new(hotel_params)
    @hotel.agency = @agency

    if @hotel.save
      redirect_to dashboard_path, notice: "Travel created successfully."
    else
      puts @hotel.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :checkin, :checkout, :extra_info, :model_agency_profile_id)
  end
end
