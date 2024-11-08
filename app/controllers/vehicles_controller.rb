class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.company_id = current_company.id
    @vehicle.vehicle_type = "#{params[:vehicle][:vehicle_weight]}#{params[:vehicle][:vehicle_category]}#{params[:vehicle][:vehicle_kind]}#{params[:vehicle][:vehicle_kind2]}"
    if @vehicle.save
      redirect_to company_vehicle_management_path(@vehicle.company.id)
    else
      puts @vehicle.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      redirect_to company_vehicle_management_path(@vehicle.company.id)
    else
      render :edit
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    redirect_to company_vehicle_management_path(@vehicle.company.id)
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:vehicle_number, :vehicle_type, :status, :mileage, :fuel_type, :company_id, :employee_id)
  end

end
