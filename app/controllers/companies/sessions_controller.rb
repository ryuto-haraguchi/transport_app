# frozen_string_literal: true

class Companies::SessionsController < Devise::SessionsController
  skip_before_action :require_no_authentication, only: [:new]
  before_action :redirect_if_signed_in, only: [:new]
  
  protected

  def after_sign_in_path_for(resource)
    company_path(resource)
  end

  def redirect_if_signed_in
    if company_signed_in?
      redirect_to company_path(current_company) 
    end
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:company_code, :password])
  end

  def after_timeout_path_for(resource_or_scope)
    new_company_session_path
  end

end
