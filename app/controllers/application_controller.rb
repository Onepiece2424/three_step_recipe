class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :check_admin_authorization
  authorize_resource

  # def check_admin_authorization
  #   if request.path.start_with?('/admin')
  #     authorize! :access_admin_page
  #   end
  # end

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to recipes_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
end
