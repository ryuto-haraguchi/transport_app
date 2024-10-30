class AddDetailsToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :name, :string
    add_column :employees, :phone_number, :string
  end
end
