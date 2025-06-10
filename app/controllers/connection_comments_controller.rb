class ConnectionCommentsController < ApplicationController
  before_action :authenticate_user!

  # def new
  #   @connection_comment = ConnectionComment.new
  # end

  def create
    @connection = Connection.find(params[:connection_id])
    @comment = @connection.connection_comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to connection_path(@connection), notice: "Comment added."
    else
      @listing = @connection.listing
      @client = @listing&.client
      @model_profile = @connection.model_agency_profile
      @agency = @connection.agency

      flash.now[:alert] = @comment.errors.full_messages.to_sentence
      render "connections/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:connection_comment).permit(:comment)
  end
end
