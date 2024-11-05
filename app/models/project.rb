class Project < ApplicationRecord
  belongs_to :employee
  belongs_to :vehicle, optional: true

  has_many_attached :delivery_slip_images

  enum status: { 未集荷: 0, 進行中: 1, 完了: 2 }

  validates :project_name, presence: true
  validates :vehicle_type, presence: true
  validates :planned_collection_date, presence: true
  validates :planned_delivery_date, presence: true
end
