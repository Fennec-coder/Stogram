# frozen_string_literal: true

class GradesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @grade = Grade.where(user_id: current_user.id, post_id: params[:post_id])

    if @grade.empty?
      Grade.create(user_id: current_user.id, post_id: params[:post_id])
      redirect_to user_post_path(current_user, @post)
    elsif @grade.positive != params[:positive]
      @grade.update(:positive, params[:positive])
    else
      redirect_to @post, flash: { alert: 'Grade is already there' }
    end
  end

  def destroy
    Grade.destroy_by(user_id: current_user.id, post_id: params[:post_id])
    redirect_to user_post_path(user_id: current_user, id: params[:post_id])
  end

  def index
    @grades = Grade.where(post_id: params[:post_id])
    users_ids_who_graded = Grade.pluck(:user_id)

    @users = User.select { |user| users_ids_who_graded.include? user.id }
  end
end
