class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_number
      t.string :vehicle_type
      t.string :status
      t.integer :mileage
      t.string :fuel_type
      t.references :company, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
