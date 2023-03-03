class Earning < ApplicationRecord
  validates :employee_external_ref, presence: true
  validates :earning_date, presence: true
  validates :amount, presence: true
  validates :employee_id, presence: true

  def self.updatable_fields
    column_names.dup.reject! { |el| %w[id created_at updated_at employee_id].include? el }
  end
end
