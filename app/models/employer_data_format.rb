class EmployerDataFormat < ApplicationRecord
  belongs_to :employer

  validates :employer_id, presence: true
  validates :fields, presence: true
end
