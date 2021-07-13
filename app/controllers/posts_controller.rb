class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:description))
    @post.user_id = current_user.id if user_signed_in?
    if @post.save
      redirect_to @post, flash: {success: 'Post was added'}
    else
      render :new, flash: {alert: 'Some error occured'}
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post, flash: {success: 'Post was updated'}
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to :user_root
  end

  def post_params
    params.require(:post).permit(:description, :image)
  end
end
