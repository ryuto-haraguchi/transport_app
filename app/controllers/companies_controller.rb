class CompaniesController < ApplicationController
  before_action :authenticate_company!

  def show
    @company = Company.find(params[:id])
    @active_employees = @company.employees.joins(:attendances)
                                .where(attendances: { clock_out_time: nil })
                                .select('employees.*, attendances.clock_in_time')
  end

  def edit
  end

  def employee_management
    @company =  Company.find(current_company.id)
    @company_employees = @company.employees.includes(:attendances, :vehicles)
  end

  def employee_management_show
    @company_employee = Employee.find(params[:employee_id])
  end

  def vehicle_management
    @company =  Company.find(params[:company_id])
    @company_vehicles = @company.vehicles.includes(:attendances, :employees)
  end

end
