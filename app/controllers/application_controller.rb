class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_company!, if: :companies_controller?
  before_action :authenticate_employee!, if: :employees_controller?

  helper_method :companies_controller?, :employees_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :contact_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :contact_number])
  end

  def companies_controller?
    devise_controller? && resource_name == :company || controller_name == 'companies'
  end

  def employees_controller?
    devise_controller? && resource_name == :employee || controller_name == 'employees'
  end

end
