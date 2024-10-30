class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :contact_number
      t.string :company_code, unique: true

      t.timestamps
    end
    add_index :companies, :company_code, unique: true
  end
end
