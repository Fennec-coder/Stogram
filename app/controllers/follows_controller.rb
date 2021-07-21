class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    follower_user = current_user
    following_user = User.find(params[:being_followed_id])

    Follow.create(follower: follower_user, being_followed: following_user)

    redirect_to user_followings_path(current_user)
  end

  def destroy
    follower_user = current_user
    following_user = User.find(params[:being_followed_id])

    Follow.where(follower: follower_user, being_followed: following_user).destroy_all

    redirect_to user_followings_path(current_user)
  end
end
