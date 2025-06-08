class ConnectionsController < ApplicationController
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

  def connection_params
  end
end
