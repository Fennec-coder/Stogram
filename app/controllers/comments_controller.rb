class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(user_id: current_user.id, body: params.require(:comment).values)
    redirect_to user_post_path(current_user, @post)
  end

  def destroy
    Comment.find(params[:id]).destroy
    @post = Post.find(params[:post_id])
    redirect_to user_post_path(current_user, @post)
  end
end
