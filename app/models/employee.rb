class Employee < ApplicationRecord
  has_many :earnings

  validates :name, presence: true
  validates :external_ref, presence: true
  validates :external_ref, presence: true
  validates :employer_id, presence: true
end
