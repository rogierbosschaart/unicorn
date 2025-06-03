class ListingsController < ApplicationController

  def index
    @listings = Listings.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @user = current_user
    @listing.user_id = @user.id
    @item.save
  end
end
