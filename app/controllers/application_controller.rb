class ApplicationController < ActionController::Base  
  before_action :authenticate_company!, if: :companies_controller?
  before_action :authenticate_employee!, if: :employees_controller?

  helper_method :companies_controller?, :employees_controller?, :vehicles_controller?


  protected

  def companies_controller?
    devise_controller? && resource_name == :company || controller_name == 'companies'
  end

  def employees_controller?
    devise_controller? && resource_name == :employee || controller_name == 'employees'
  end

  def vehicles_controller?
    controller_name == 'vehicles'
  end

end
