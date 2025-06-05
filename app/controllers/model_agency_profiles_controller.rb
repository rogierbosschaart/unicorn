class ModelAgencyProfilesController < ApplicationController
  before_action :set_user, except: [:update]

  def inbox
    if @model.connections != nil
      @connections = @model.connections
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
    @model = ModelAgencyProfile.find(params[:id])
    session[:selected_model_ids] ||= []

    if session[:selected_model_ids].include?(@model.id)
      session[:selected_model_ids].delete(@model.id)
    else
      session[:selected_model_ids] << @model.id
    end

    # @model.update(selected_params)
    redirect_to dashboard_path
  end

  private

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
end
