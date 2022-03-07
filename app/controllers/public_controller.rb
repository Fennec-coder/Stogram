# frozen_string_literal: true

class PublicController < ApplicationController
  def home
    if current_user.present?
      user_followeds = current_user.being_followeds.pluck(:id)

      @selected_posts = Post.where(user_id: user_followeds).order(created_at: :desc)
      @new_posts = Post.where.not(
        user_id: (user_followeds << current_user.id)
      ).limit(15).order(created_at: :desc) unless current_user.nil?
    end
    @new_posts = Post.limit(15).order(created_at: :desc)

  end
end
