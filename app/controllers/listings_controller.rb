class ListingsController < ApplicationController
  def new
    @agency = Agency.find(params[:agency_id])
    @listing = Listing.new(listing_type: params[:type])
  end

  def create
    @agency = Agency.find(params[:agency_id])
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      redirect_to dashboard_path, notice: "Listing created successfully."
    else
      puts @listing.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def listing_params
    params.require(:listing).permit(
      :start_date, :end_date, :listing_type,
      :location, :address, :photographer, :stylist, :client_id
    )
  end
end
