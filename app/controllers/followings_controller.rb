# frozen_string_literal: true

class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @followings = @user.being_followeds
  end
end
