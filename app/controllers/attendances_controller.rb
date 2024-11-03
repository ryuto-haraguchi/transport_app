class AttendancesController < ApplicationController
  before_action :set_vehicle, only: [:clock_in, :clock_out]
  before_action :authenticate_employee!

  def new
    @attendance = Attendance.new
  end

  def clock_in
    @attendance = Attendance.new(employee: current_employee, vehicle: @vehicle, clock_in_time: Time.current)
    if @attendance.save
      @vehicle.update(status: "稼働中")
      redirect_to employee_path(current_employee), notice: "出勤しました"
    else
      redirect_to employee_path(current_employee), alert: "出勤に失敗しました"
    end
  end
  
  def clock_out
    @attendance = Attendance.find_by(employee: current_employee, vehicle: @vehicle, clock_in_time: nil)
    if @attendance
      @attendance.update(clock_out_time: Time.current)
      @vehicle.update(status: "未稼働")
      redirect_to employee_path(current_employee), notice: "退勤しました"
    else
      redirect_to employee_path(current_employee), alert: "退勤に失敗しました"
    end
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end
      
end
