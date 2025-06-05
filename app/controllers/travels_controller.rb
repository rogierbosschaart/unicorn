class TravelsController < ApplicationController

  def new
    @agency = Agency.find(params[:agency_id])

    @travel = Travel.new
  end

  def create
    @agency = Agency.find(params[:agency_id])
    @travel = Travel.new(travel_params)
    @travel.agency = @agency

    if @travel.save
      redirect_to dashboard_path, notice: "Travel created successfully."
    else
      puts @travel.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def travel_params
    params.require(:travel).permit(:origin, :destination, :date, :time, :extra_info, :model_agency_profile_id)
  end
end
