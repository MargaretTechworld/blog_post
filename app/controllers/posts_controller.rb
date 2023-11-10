class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @author = @post.author
    @post.likes.destroy_all 
    @post.comments.destroy_all 
    @post.destroy
    redirect_to user_posts_path(@author)
  end
  private

  def post_params
    params.require(:post).permit(:text, :title)
  end
end
