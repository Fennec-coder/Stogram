# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_theme

  def set_theme
    if params[:theme].present?
      cookies[:theme] = params[:theme].to_sym
      redirect_to(request.referrer || root_path)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username avatar avatar_cache remove_avatar])
  end
end
