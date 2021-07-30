class FollowingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followings = @user.being_followeds
  end
end
