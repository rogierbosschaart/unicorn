class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:map, :agenda]

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
    @model_agency_profile = ModelAgencyProfile.new
    @agency = current_user.agency
    @models = ModelAgencyProfile.includes(:user)
                                .where(agency: @agency)
    @listing = Listing.new
    session[:selected_model_ids] ||= []
  end

  def map
    @listings = Listing.geocoded
    @markers = @listings.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { listing: listing }),
        marker_html: render_to_string(partial: "marker", locals: { listing: listing })
      }
    end
  end

  def agenda
  @listings_by_date = Listing.all.each_with_object(Hash.new { |h, k| h[k] = [] }) do |listing, hash|
    start = listing.start_date || (listing.start_time.present? ? Date.current : nil)
    next unless start

      finish = listing.end_date || start

      (start..finish).each do |date|
        hash[date] << listing
      end
    end
  end

  private

  def set_user
    if current_user.user_type == 'mannequin'
      redirect_to inbox_path
    end
  end
end
