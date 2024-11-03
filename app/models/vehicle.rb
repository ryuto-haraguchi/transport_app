class Vehicle < ApplicationRecord
  belongs_to :company
  has_many :attendances
  has_many :employees, through: :attendances
end
