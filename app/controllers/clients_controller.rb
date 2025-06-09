class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to dashboard_path, notice: "Added new client"
    else
      puts @client.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :contact_info)
  end
end
