class Employees::EmployeesController < ApplicationController
  before_action :authenticate_employee!, only: [:show ,:edit]

  def show
    @employee = Employee.find(params[:id])
    @employee_projects = @employee.projects.order(planned_collection_date: :asc)
  end

  def edit
  end

end
