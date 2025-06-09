class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_user, except: [:map]

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
    @models = ModelAgencyProfile.includes(:user)
                                .where(agency: @agency)
    @listing = Listing.new
    session[:selected_model_ids] ||= []
  end

  private

  def set_user
    if current_user.user_type == 'mannequin'
      redirect_to inbox_path
    end
  end

  def map
    @listings = Listing.geocoded
    @markers = @listings.map do |listing|
      {
        latitude: listing.latitude,
        longitude: listing.longitude,
        info_window_html: render_to_string(
          partial: "listings/info_window",
          locals: { listing: listing }
        )
      }
    end
  end
end
