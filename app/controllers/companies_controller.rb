class CompaniesController < ApplicationController
  before_action :authenticate_company  

  def show
    @company = Company.find(params[:id])
  end

  def edit
  end

  def employee_management
    @company =  Company.find(params[:company_id])
    @company_employees = @company.employees.includes(:attendances, :vehicles)
  end

  def vehicle_management
    @company =  Company.find(params[:company_id])
    @company_vehicles = @company.vehicles.includes(:attendances, :employees)
  end

end
