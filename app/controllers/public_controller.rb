# frozen_string_literal: true

class PublicController < ApplicationController
  def home
    unless current_user.nil?
      @selected_posts = Post.where(user_id: current_user.followers.pluck(:id)).order(created_at: :desc)
    end
    @new_posts = Post.limit(15).order(created_at: :desc)
    @new_posts = Post.where.not(user_id: current_user.id).limit(15).order(created_at: :desc) unless current_user.nil?
  end
end
