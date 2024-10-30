class AddCompanyIdToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :company_id, :integer
  end
end
