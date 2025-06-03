class ListingsController < ApplicationController
before_action :authenticate_user!

  def index
    @agency = Agency.find(params[:agency_id])
    @listings = @agency.listings.where(user: current_user)
  end

  def new
    @agency = Agency.find(params[:agency_id])
    @listing = @agency.listings.build
  end

  def create
    @agency = Agency.find(params[:agency_id])
    @listing = @agency.listings.build(listing_params)
    @listing.user = current_user
    @listing.client = Client.last

    if @listing.save
      redirect_to agency_listings_path(@agency), notice: "Listing created successfully."
    else
      render :new, status: :unprocessable_entity, notice: "ERROR"
    end
  end

    private

  def listing_params
    params.require(:listing).permit(
      :start_date, :end_date, :listing_type,
      :location, :address, :photographer, :stylist
    )
  end
end
