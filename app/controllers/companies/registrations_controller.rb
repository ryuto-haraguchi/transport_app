# frozen_string_literal: true

class Companies::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new]
  before_action :redirect_if_signed_in, only: [:new]
  
  protected

  def after_sign_up_path_for(resource)
    company_path(resource)
  end

  def redirect_if_signed_in
    if company_signed_in?
      redirect_to company_path(current_company) 
    end
  end

end
