class Employees::EmployeesController < ApplicationController
  before_action :authenticate_employee!, only: [:show ,:edit]

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
  end

end
