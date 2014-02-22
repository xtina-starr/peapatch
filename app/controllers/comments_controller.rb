class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = @current_user.try(:comments).create(comment_params)
    if @comment.save
      post = Post.find(params[:comment][:post_id].to_i)
      post.comments << @comment
      respond_to do |format|
        format.html{ redirect_to :back }
        format.js
      end
    else
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment_id = params[:id]
    @comment.destroy
    respond_to do |format|
      format.html{ redirect_to :back }
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content, :datetime)
  end
end