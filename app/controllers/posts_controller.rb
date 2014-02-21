class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    unless @current_user.nil?
      if @current_user.admin
        @post = @current_user.posts.create(post_params)
        if @post.save
          # Resque.enqueue(EmailJob, @post.id)
          PostMailer.new_post(@post.id).deliver
          redirect_to posts_path, notice: "Your post was created!"
        else
          render new_post_path
        end
      else
        redirect_to root_path, notice: "Only a logged-in administrator can write posts"
      end
    else
      redirect_to root_path, notice: "Only a logged-in administrator can write posts"
    end
  end

  def index
    @posts = Post.all 
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private
  def post_params
    params.require(:post).permit(:title, :user_id, :content, :datetime)
  end
end