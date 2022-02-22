# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @usernames = Search.by_username(params[:search])
    @emails = Search.by_email(params[:search])
    @names = Search.by_name(params[:search])
    @descriptions = Search.by_description_of_post(params[:search])
  end
end
