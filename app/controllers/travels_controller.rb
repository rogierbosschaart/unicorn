class TravelsController < ApplicationController
  # belongs_to :user

  def index
    @travels = Travel.all
    @hotels = Hotel.all
  end
end
