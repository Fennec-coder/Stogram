# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if user_signed_in?
    if @post.save
      redirect_to @post, flash: { success: 'Post was added' }
    else
      flash[:order_errors] = @post.errors.full_messages
      render :new, flash: { alert: 'Some error occured' }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post, flash: { success: 'Post was updated' }
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_path(current_user)
  end

  def post_params
    params.require(:post).permit(:description, :image)
  end
end
