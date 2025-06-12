class ModelAgencyProfilesController < ApplicationController
  before_action :set_model_agency_profile
  before_action :set_user, except: [:update, :home, :new, :create, :agenda, :map]

  def new
    @model_agency_profile = ModelAgencyProfile.new
    @agency = current_user.agency
  end

  def home
    @agency = current_user.model_agency_profiles.where(active: true).first.agency
    @posts = Post.all.order(created_at: :desc)
  end

  def inbox
    @agency = current_user.model_agency_profiles.where(active: true).first.agency
    return if @model.connections.nil?

      @connections = @model.connections.where(agency_id: @agency.id).order(created_at: :desc)
      @castings     = @connections.joins(:listing)
                                  .where(listings: { listing_type: 'casting' })
      @options      = @connections.joins(:listing)
                                  .where(listings: { listing_type: 'option' })
      @jobs         = @connections.joins(:listing)
                                  .where(listings: { listing_type: 'job' })
  end

  def create
    @model_agency_profile = ModelAgencyProfile.new(model_agency_profile_params)
    @model_agency_profile.user = User.find(model_agency_profile_params[:user_id])
    @model_agency_profile.agency = current_user.agency
    if @model_agency_profile.save
      redirect_to dashboard_path, notice: 'Model was successfully added to your listings!'
    else
      flash[:alert] = "There was an error adding the model to your listings."
      @agency = current_user.agency
      render 'pages/dashboard', status: :unprocessable_entity
    end
  end


  def travel
    @agency = current_user.model_agency_profiles.where(active: true).first.agency
    @travels = @model.travels.where(agency: @agency)
    @hotels = @model.hotels.where(agency: @agency)


    # @agency = current_user.model_agency_profiles.where(active: true).first.agency
    # @travels = current_user.model_agency_profiles.where(active: true).first.travels
    # @hotels = current_user.model_agency_profiles.where(active: true).first.hotels

    # @travels = Travel.where(current_user == :model_agency_profile)
    # @hotels = Hotel.where(current_user == :model_agency_profile)
  end

  def update
    @model = ModelAgencyProfile.find(params[:id])
    session[:selected_model_ids] ||= []

    if session[:selected_model_ids].include?(@model.id)
      session[:selected_model_ids].delete(@model.id)
    else
      session[:selected_model_ids] << @model.id
    end
    redirect_to dashboard_path
  end

  def switch
    current_user.model_agency_profiles.update_all(active: false)
    profile = current_user.model_agency_profiles.find(params[:id])
    profile.update(active: true)
    redirect_to dashboard_path
  end

  def agenda
    if current_user.user_type == 'agent'
      redirect_to dashboard_path
      return
    end

    active_profile = current_user.model_agency_profiles.find_by(active: true)
    if active_profile
      @listings = Listing.joins(:connections)
                         .where(connections: { model_agency_profile_id: active_profile.id })
                         .where(start_date: Date.today.beginning_of_month..Date.today.end_of_month)
                         .distinct
    else
      @listings = Listing.none
    end
  end

  def map
    active_profile = current_user.model_agency_profiles.find_by(active: true)
    @listings = if active_profile
                  Listing.joins(:connections)
                        .where(connections: { model_agency_profile_id: active_profile.id })
                        .geocoded
                else
                  Listing.none
                end

    @markers = @listings.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { listing: listing }),
        marker_html: render_to_string(partial: "marker", locals: { listing: listing })
      }
    end
  end

  private

  def model_agency_profile_params
    params.require(:model_agency_profile).permit(:user_id)
  end

  def set_user
    if current_user.user_type == 'agent'
      redirect_to dashboard_path
    else
      @model = current_user.model_agency_profiles.find_by(active: true)
    end
  end

  def selected_params
    params.require(:model).permit(:selected)
  end

  def set_model_agency_profile
    @model_agency_profile = current_user.model_agency_profiles.find_by(active: true)
  end
end
