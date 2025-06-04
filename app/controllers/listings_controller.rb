class ListingsController < ApplicationController
  def create
    @agency = Agency.find(params[:agency_id])
    @listing = current_user.listings.build(listing_params)
    @listing.client = Client.last

    if @listing.save
      redirect_to agency_listings_path(@agency), notice: "Listing created successfully."
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
