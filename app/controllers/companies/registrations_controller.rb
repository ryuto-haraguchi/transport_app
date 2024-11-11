# frozen_string_literal: true

class Companies::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :require_no_authentication, only: [:new]
  before_action :redirect_if_signed_in, only: [:new]
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :contact_number, :email, :company_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :email, :contact_number])
  end

  def after_sign_up_path_for(resource)
    company_path(resource)
  end

  def redirect_if_signed_in
    if company_signed_in?
      redirect_to company_path(current_company) 
    end
  end

end
