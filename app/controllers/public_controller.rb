class PublicController < ApplicationController
  def home
    @user = current_user
    @selected_posts = []
    # @selected_posts = Post.where { |post| @user.followings.include? post.user_id } unless @user.nil?
    @selected_posts = Post.where(user_id: @user.followings.pluck(:id)).order(created_at: :desc)
    @new_posts = Post.limit(15).order(created_at: :desc)

  end
end
