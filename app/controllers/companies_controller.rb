class CompaniesController < ApplicationController
  before_action :authenticate_company!

  def show
    @company = Company.find(params[:id])
    @active_employees = @company.employees.joins(:attendances)
                                .where(attendances: { clock_out_time: nil })
                                .select('employees.*, attendances.clock_in_time')
    @attendances = Attendance.joins(:employee)
                            .where(employees: { company_id: @company.id })
                            .where(attendances: { clock_in_time: Date.yesterday.all_day })
                            .order('attendances.clock_out_time DESC')
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_path(current_company)
    else
      render :edit
    end
  end

  def employee_management
    @company =  Company.find(current_company.id)
    @company_employees = @company.employees.includes(:attendances, :vehicles)
  end

  def employee_management_show
    @company_employee = Employee.find(params[:employee_id])
  end

  def employee_management_attendances
    @employee = Employee.find(params[:employee_id])
    @employee_attendances = @employee.attendances.order('attendances.clock_in_time DESC')
  end

  def vehicle_management
    @company =  Company.find(params[:company_id])
    @company_vehicles = @company.vehicles.includes(:attendances, :employees)
  end

  private

  def company_params
    params.require(:company).permit(:name, :address, :contact_number)
  end

end
