class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.datetime :clock_in_time
      t.datetime :clock_out_time

      t.timestamps
    end
  end
end
