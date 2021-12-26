class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(user_id: current_user.id, body: params.require(:comment).values[0])
    redirect_to user_post_path(current_user, @post)
  end

  def destroy
    Comment.find(params[:id]).destroy
    @post = Post.find(params[:post_id])
    redirect_to user_post_path(current_user, @post)
  end
end
