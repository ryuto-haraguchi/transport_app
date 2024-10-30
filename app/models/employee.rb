class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company
  attr_accessor :company_code

  before_validation :assign_company

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :company_id, presence: true

  private

  def assign_company
    self.company = Company.find_by(company_code: company_code)
    errors.add(:company_code, "が無効です") unless company
  end

end
