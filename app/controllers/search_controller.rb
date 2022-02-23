# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @usernames = Search.by_username(permitted_params)
    @emails = Search.by_email(permitted_params)
    @names = Search.by_name(permitted_params)
    @descriptions = Search.by_description_of_post(permitted_params)
  end

  def permitted_params
    params[:search]
  end
end
