class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_admin_authorization

  def check_admin_authorization
    if request.path.start_with?('/admin')
      authorize! :access_admin_page
    end
  end

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: '画面を閲覧する権限がありません。'
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
end
