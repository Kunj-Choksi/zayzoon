class EmployerDataFormat < ApplicationRecord
  belongs_to :employer

  validates :employee_id, presence: true
  validates :earning_date, presence: true
  validates :earning_amount, presence: true
  validates :employer_id, presence: true
end
