# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @query = User.ransack(params[:query])
    @users = @query.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.select { |post| post.user_id == @user.id }
    @followers = Follow.select { |follower| follower.being_followed_id == @user.id }
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(post_params)
    redirect_to user, flash: { success: 'User was updated' }
  end

  def post_params
    params.require(:user).permit(:avatar)
  end
end
