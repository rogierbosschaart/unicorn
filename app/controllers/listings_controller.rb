class ListingsController < ApplicationController
  def index
    @listings = Listing.joins(:user)
                       .where(users: { agency_id: current_user.agency_id })
  end

  def show
    @agency = Agency.find(params[:agency_id])
    @listing = Listing.find(params[:id])
  end

  def new
    @agency = Agency.find(params[:agency_id])
    @listing = Listing.new(listing_type: params[:type])
    @selected_models = ModelAgencyProfile.where(id: session[:selected_model_ids])
  end

  def create
    @agency = Agency.find(params[:agency_id])
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      create_connections_from_session
      redirect_to dashboard_path, notice: "Listing created successfully."
    else
      puts @listing.errors.full_messages
      @selected_models = ModelAgencyProfile.where(id: session[:selected_model_ids])
      render :new, status: :unprocessable_entity
    end
  end

  private

  def listing_params
    params.require(:listing).permit(
      :start_date, :end_date, :listing_type,
      :location, :address, :photographer, :stylist, :client_id,
      :extra_info, :start_time, :end_time
    )
  end

  def create_connections_from_session
    selected_model_ids = session[:selected_model_ids] || []

    selected_models.each do |model|
      Connection.create!(
        model_agency_profile: model,
        listing: @listing,
        agency: @listing.agency
      )
    end
    session.delete(:selected_model_ids)
  end

  # def create_connection_for_every_model
  #   @connections = Connection.all
  #   @models = ModelAgencyProfile.where(agency: @agency, selected: true)
  #   @models.each do |model|
  #     Connection.create(
  #       model_agency_profile: model,
  #       listing: @listing,
  #       agency_id: @agency.id
  #     )
  #   end
  # end
end
