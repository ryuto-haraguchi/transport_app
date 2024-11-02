# frozen_string_literal: true

class Employees::SessionsController < Devise::SessionsController
  skip_before_action :require_no_authentication, only: [:new]
  before_action :redirect_if_signed_in, only: [:new]
  before_action :configure_sign_in_params, only: [:create]

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:id, :phone_number])
  end

  def after_sign_in_path_for(resource)
    employee_path(resource) 
  end

  def redirect_if_signed_in
    if employee_signed_in?
      redirect_to employee_path(current_employee) 
    end
  end
  
end
