class PublicController < ApplicationController
  def home
    @user = current_user
    @selected_posts = []
    @selected_posts = Post.where(user_id: @user.followings.pluck(:id)).order(created_at: :desc) unless @user.nil?
    @new_posts = Post.limit(15).order(created_at: :desc)

  end
end
