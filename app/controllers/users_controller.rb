class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def profile
    @user = current_user
    @posts = Post.select{|post| post.user_id == @user.id}
  end

end
