class Company < ApplicationRecord
  before_validation :generate_company_code, on: :create

  validates :name, presence: true
  validates :company_code, presence: true, uniqueness: true

  private

  def generate_company_code
    self.company_code = SecureRandom.hex(6)
  end
end
