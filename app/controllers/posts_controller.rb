class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.agency = current_user.agency
    @post.user = current_user

    if @post.save
      redirect_to posts_path, notice: "Added post"
    else
      puts @post.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_text)
  end
end
