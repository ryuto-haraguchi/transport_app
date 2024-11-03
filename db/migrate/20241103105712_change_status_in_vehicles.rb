class ChangeStatusInVehicles < ActiveRecord::Migration[6.1]
  def change
    change_column_default :vehicles, :status, "未稼働"
  end
end
