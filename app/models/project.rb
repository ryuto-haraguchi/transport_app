class Project < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :vehicle, optional: true
  belongs_to :company

  has_many_attached :delivery_slip_images

  enum status: { 未集荷: 0, 進行中: 1, 完了: 2 }

  validates :project_name, presence: true
  validates :description, presence: true
  validates :vehicle_type, presence: true

end
