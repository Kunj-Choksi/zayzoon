class Employer < ApplicationRecord
  has_many :employees
  has_one :employer_data_format

  validates :name, presence: true
end
