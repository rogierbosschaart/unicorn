class AgenciesController < ApplicationController

  def show
    @agency = Agency.find(params[:id])
    @clients = Client.all
  rescue ActiveRecord::RecordNotFound

    flash[:alert] = "Agency with ID #{params[:id]} does not found."
    redirect_to root_path
  end

end
