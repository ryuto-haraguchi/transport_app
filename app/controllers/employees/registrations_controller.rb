# frozen_string_literal: true

class Employees::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new]
  before_action :redirect_if_signed_in, only: [:new]
  before_action :configure_sign_up_params, only: [:create]


  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_code, :phone_number, :name])
  end

  def after_sign_up_path_for(resource)
    employee_path(resource) 
  end

  def redirect_if_signed_in
    if employee_signed_in?
      redirect_to employee_path(current_employee) 
    end
  end

end
