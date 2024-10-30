class Company < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:company_code]
  before_validation :generate_company_code, on: :create

  validates :name, presence: true
  validates :company_code, presence: true, uniqueness: true

  has_many :employees
  
  private

  def generate_company_code
    self.company_code = SecureRandom.hex(6)
  end
end
