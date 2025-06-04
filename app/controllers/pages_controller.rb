class PagesController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @agency = current_user.agency

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
