class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.agency = current_user.agency
    @post.user = current_user

    if @post.save
      redirect_to home_path
    else
      puts @post.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_text, :photo)
  end
end
