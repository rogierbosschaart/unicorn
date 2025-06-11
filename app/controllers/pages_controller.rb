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

    if params[:query].present?
      @models_for_display = ModelAgencyProfile.search_by_name(params[:query]).where(agency: @agency)
    else
      @models_for_display = @models
    end
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
<<<<<<< HEAD
    @listings_by_date = Listing.all.each_with_object(Hash.new { |h, k| h[k] = [] }) do |listing, hash|
    start = listing.start_date || (listing.start_time.present? ? Date.current : nil)
    next unless start
=======
    @listings = Listing.where(start_date: Date.today.beginning_of_month..Date.today.end_of_month)
>>>>>>> 599880badd93341440b06f02f97325a6dd32b143

    if params[:date].present?
      selected_date = Date.parse(params[:date]) rescue nil
      @selected_listings = Listing.where(start_date: selected_date)
    else
      @selected_listings = []
    end

  end

  private

  def set_user
    if current_user.user_type == 'mannequin'
      redirect_to inbox_path
    end
  end
end
