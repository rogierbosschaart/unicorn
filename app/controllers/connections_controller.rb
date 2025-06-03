class ConnectionsController < ApplicationController
  def index
    @connections = Connection.where(user: current_user)
  end
end
