class Vehicle < ApplicationRecord
  belongs_to :company
  belongs_to :employee, optional: true
end
