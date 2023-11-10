class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    return unless @comment.save

    redirect_to user_post_path(current_user, @post)
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
