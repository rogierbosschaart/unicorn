class PagesController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @agency = Agency.find_by(id: current_user.agency_id)
    @listing = Listing.new

    if @agency.present?
      @models = ModelAgencyProfile.includes(:user)
                                  .where(agency_id: @agency.id)
                                  .map(&:user)
                                  .select { |user| user.mannequin? }
    else
      @models = []
      flash[:alert] = "Вы не привязаны к агентству."
    end
  end
end
