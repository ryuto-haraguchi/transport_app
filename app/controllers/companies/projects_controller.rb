class Companies::ProjectsController < ApplicationController

  def index
    @projects = Project.where(company_id: current_company.id)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.company_id = current_company.id
    @project.vehicle_type = "#{params[:project][:vehicle_weight]}#{params[:project][:vehicle_category]}#{params[:project][:vehicle_kind]}#{params[:project][:vehicle_kind2]}"
    if @project.save
      redirect_to companies_project_path(@project)
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
    params.require(:project).permit(:planned_collection_date, :planned_delivery_date, :project_name, :description, :company_id, :employee_id, :vehicle_id, :status, :amount)
  end

end
