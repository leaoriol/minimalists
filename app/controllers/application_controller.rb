class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  def hello
    render html: "M I N I M A L"
  end

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
end

# list controller - for show action, don't want anyone to see list show - call methods to see if they are logged in, otherwise redirect to home page
