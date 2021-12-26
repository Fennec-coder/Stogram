# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    followed = User.find(params[:being_followed_id])

    Follow.create(
      follower: current_user,
      being_followed: followed
    )

    redirect_to followed
  end

  def destroy
    followed = User.find(params[:id])

    Follow.where(
      follower: current_user,
      being_followed: followed
    ).destroy_all

    redirect_to followed
  end
end
