# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = Post.select { |post| post.user_id == @user.id }
    @followers = Follow.select { |follower| follower.being_followed_id == @user.id }
  end
end
