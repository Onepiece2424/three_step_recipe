class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  authorize_resource :class => false

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to recipes_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
end
