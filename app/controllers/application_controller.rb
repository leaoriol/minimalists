class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def verify_logged_in
      if !user_signed_in?
        respond_to do |format|
          format.html { redirect_to '/users/sign_in', notice: 'Please log in to access this page' }
        end
      end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    lists_path
  end
end

