class PublicController < ApplicationController
  def home
    @posts = Post.limit(15)
  end
end
