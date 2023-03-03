class Earning < ApplicationRecord
  validates :employee_external_ref, presence: true
  validates :earning_date, presence: true
  validates :amount, presence: true
  validates :employee_id, presence: true
end
