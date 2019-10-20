class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, if: :api_request?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    posts_path
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

private

  def api_request?
    params[:controller].split('/')[0] == 'devise_token_auth'
  end
end
