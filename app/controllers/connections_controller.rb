class ConnectionsController < ApplicationController
  def show
    @connection = Connection.find(params[:id])
    @listing = @connection.listing
    @client = @listing.client if @listing.present?
    @model_profile = @connection.model_agency_profile
    @agency = @connection.agency
  end

  private

  def connection_params
  end
end
