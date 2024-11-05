class Companies::ProjectsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
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
