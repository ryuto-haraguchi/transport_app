class Vehicle < ApplicationRecord
  belongs_to :company
  has_many :employees, optional: true, through: :attendances
end
