class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:phone_number, :id]

  belongs_to :company
  attr_accessor :company_code
  has_one :vehicles, through: :attendances
  has_many :attendances, dependent: :destroy

  before_validation :assign_company

  validates :name, presence: true
  validates :phone_number, presence: true, uniqueness: true, length: {minimum:11, maximum:11}, format: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
  validates :company_id, presence: true

  private

  def assign_company
    self.company = Company.find_by(company_code: company_code)
    errors.add(:company_code, "が無効です") unless company
  end

end
