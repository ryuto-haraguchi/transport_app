class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.datetime :planned_collection_date
      t.datetime :planned_delivery_date
      t.string :project_name
      t.text :description
      t.string :vehicle_type
      t.references :company, null: false, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.integer :status, default: 0
      t.integer :amount
      t.datetime :actual_collection_date
      t.datetime :actual_delivery_date

      t.timestamps
    end
  end
end
