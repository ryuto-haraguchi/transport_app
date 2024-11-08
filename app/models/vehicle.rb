class Vehicle < ApplicationRecord
  belongs_to :company
  has_many :attendances, dependent: :nullify
  has_many :employees, through: :attendances
  has_many :projects, dependent: :nullify
end
