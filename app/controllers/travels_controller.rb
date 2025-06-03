class TravelsController < ApplicationController
  before_action :set_agency

  def index
    # Теперь, когда @agency доступно, вы можете фильтровать travels и hotels по нему
    @travels = @agency.travels # предполагается, что у Agency есть has_many :travels
    @hotels = @agency.hotels   # предполагается, что у Agency есть has_many :hotels
    # Если у вас нет has_many :travels и has_many :hotels в Agency,
    # то нужно будет сделать так:
    # @travels = Travel.where(agency: @agency)
    # @hotels = Hotel.where(agency: @agency)
  end

  # ... другие методы ...

  private

  # Метод для загрузки агентства из параметров маршрута
  def set_agency
    # params[:agency_id] берется из URL: /agencies/:agency_id/travels
    @agency = Agency.find(params[:agency_id])
  end
end
