class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.select(user_id: current_user.id, post_id: params[:post_id])

    if @like.empty?
      Like.create(user_id: current_user.id, post_id: params[:post_id])
      redirect_to user_post_path(current_user, @post)
    else
      redirect_to @post, flash: { alert: 'Like is already there' }
    end

  end

  def destroy
    Like.destroy_by(user_id: current_user.id, post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    redirect_to user_post_path(current_user, @post)
  end

  def index
    likes = Like.where(post_id: params[:post_id])
    users_ids_who_liked = likes.map(&:user_id)

    @users = User.select { |user| users_ids_who_liked.include? user.id }
  end
end
