class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def edit
  end

  def employee_management
    @company =  Company.find(params[:company_id])
    @company_employees = @company.employees
  end

  def vehicle_management
    @company =  Company.find(params[:company_id])
    @company_vehicles = @company.vehicles
  end

end
