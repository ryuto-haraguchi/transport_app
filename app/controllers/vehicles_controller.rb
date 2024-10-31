class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to company_vehicle_management_path(@vehicle.company.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :vehicle_number, :vehicle_type, :status, :mileage, :fuel_type, 
      :company_id, :employee_id)
  end

end
