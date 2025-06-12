class ListingsController < ApplicationController
  def index
    @listings = Listing.joins(:user)
                       .where(users: { agency_id: current_user.agency_id })
    @agency = current_user.agency
  end

  def show
    @agency = current_user.agency
    @listing = Listing.find(params[:id])
    @connections = @listing.connections
  end

  def new
    @agency = Agency.find(params[:agency_id])
    @listing = Listing.new(listing_type: params[:type])
    model_ids = params[:selected_model_ids].to_s.split(',').map(&:to_i)
    render layout: false
  end

  def create
    @agency = Agency.find(params[:agency_id])
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      model_ids = params[:selected_model_ids].to_s.split(',').map(&:to_i)
      model_ids.each do |model_id|
        Connection.create(
          listing: @listing,
          model_agency_profile_id: model_id,
          agency_id: @agency.id
        )
      end
      redirect_to dashboard_path, notice: 'Listing and connections created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def for_date
    date = params[:date].present? ? Date.parse(params[:date]) : nil
    @listings = date ? Listing.where(start_date: date) : []
  end


  private

  def listing_params
    params.require(:listing).permit(
      :start_date, :end_date, :listing_type,
      :location, :address, :photographer, :stylist, :client_id,
      :extra_info, :start_time, :end_time, :selected_model_ids
    )
  end

  def create_connections_from_session
    selected_model_ids = session[:selected_model_ids] || []
    selected_models = ModelAgencyProfile.where(id: selected_model_ids)

    selected_models.each do |model|
      Connection.create!(
        model_agency_profile: model,
        listing: @listing,
        agency_id: model.agency.id
      )
    end
    session.delete(:selected_model_ids)
  end
end
