class Employees::ProjectsController < ApplicationController

  def start_project
    @project = Project.find(params[:id])
    @project.update(status: "進行中", actual_collection_date: Time.now)
    redirect_to employees_employee_path(current_employee)
  end

  def complete_project
    @project = Project.find(params[:id])
    @project.update(status: "完了", actual_delivery_date: Time.now)
    redirect_to employees_employee_path(current_employee)
  end

end
