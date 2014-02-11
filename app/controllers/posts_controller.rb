class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id), notice: "Your post was created!"
    else
      render new_post_path
    end
  end

  def index
    @posts = Post.all 
  end

  private
  def post_params
    params.require(:post).permit(:title, :user_id, :content, :datetime)
  end
end