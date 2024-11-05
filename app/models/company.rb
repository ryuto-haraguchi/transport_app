class Company < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:company_code]
  before_validation :generate_unique_company_code, on: :create

  has_many :employees, dependent: :destroy
  has_many :vehicles, dependent: :destroy
  has_many :projects, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :contact_number, presence: true, length: {minimum: 10, maximum: 11}, 
            format: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
  validates :company_code, presence: true, uniqueness: true, 
            length: {minimum: 12, maximum: 12}, 
            format: { with: /\A[0-9a-f]+\z/, message: "は半角英数字で入力してください" },
            on: :create
  

  private

  def generate_unique_company_code
    loop do
      self.company_code = SecureRandom.hex(6)
      break unless Company.exists?(company_code: company_code)
    end
  end

end
