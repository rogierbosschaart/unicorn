class ModelAgencyProfilesController < ApplicationController
  before_action :set_user

  def inbox
    if @model.connections != nil
      @connections = @model.connections
    # @model_agency_profile = current_user.model_agency_profile_ids
    # @connections  = Connection.where(current_user == :model_agency_profile)
    # raise
      @castings     = @connections.joins(:listing)
                            .where(listings: { listing_type: 'casting' })
      @options      = @connections.joins(:listing)
                            .where(listings: { listing_type: 'option' })
      @jobs         = @connections.joins(:listing)
                            .where(listings: { listing_type: 'job' })
    end
  end

  def travel
    @travels = Travel.where(current_user == :model_agency_profile)
    @hotels = Hotel.where(current_user == :model_agency_profile)
  end

  def update
    raise
    model = ModelAgencyProfile.find(params[:id])
  end

  private

  def set_user
    if current_user.user_type == 'agent'
      redirect_to dashboard_path
    else
      @model = current_user.model_agency_profiles.find_by(active: true)
    end
  end
end
