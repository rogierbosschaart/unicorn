class ConnectionsController < ApplicationController
  before_action :set_model_agency_profile

  def show
    @connection = Connection.find(params[:id])
    @connection.update(opened: true)
    @listing = @connection.listing
    @client = @listing&.client
    @model_profile = @connection.model_agency_profile
    @agency = @connection.agency
  end

  def create
    @connection = Connection.new
  end

  private

  def set_model_agency_profile
    @model_agency_profile = current_user.model_agency_profiles.find_by(active: true)
  end
end
