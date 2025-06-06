class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def root
    if user_signed_in?
      if current_user.user_type == 'mannequin'
        redirect_to inbox_path
      elsif current_user.user_type == 'agent'
        redirect_to dashboard_path
      else
        redirect_to new_user_session_path
      end
    end
  end

  def dashboard
    @agency = current_user.agency
    # raise
    @models = ModelAgencyProfile.includes(:user)
                                .where(agency: @agency)
                                # .map(&:user)
    @listing = Listing.new
    session[:selected_model_ids] ||= []
    # raise
    # @agency = Agency.find_by(id: current_user.agency_id)
    # @listing = Listing.new

    # if @agency.present?
    #   @models = ModelAgencyProfile.includes(:user)
    #                               .where(agency_id: @agency.id)
    #                               .map(&:user)
    #                               .select { |user| user.mannequin? }
    # else
    #   @models = []
    #   flash[:alert] = "Вы не привязаны к агентству."
    # end
  end

  private

  def set_user
    if current_user.user_type == 'mannequin'
      redirect_to inbox_path
    end
  end
end
