class Companies::ProjectsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to company_project_path(current_company, @project)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:planned_collection_date, :planned_delivery_date, :project_name, :description, :vehicle_type, :employee_id, :vehicle_id, :status, :amount)
  end

end
