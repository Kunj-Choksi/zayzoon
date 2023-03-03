require 'rails_helper'

RSpec.describe Earning, type: :model do
  describe 'model validation' do
    before do
      employer = Employer.create(name: 'AcmeCo')
  
      employee = employer.employees.create(name: 'John', external_ref: 'A123')
  
      @earning = employee.earnings.create(earning_date: Date.new(2021, 10, 14), amount: 34.7)
    end

    it 'should be valid with attrs' do
      expect(@earning).to be_valid
    end

    it 'should be invalid without earning_date' do
      @earning.earning_date = nil
      expect(@earning).to be_invalid
    end

    it 'should be invalid without amount' do
      @earning.amount = nil
      expect(@earning).to be_invalid
    end

    it 'should be invalid without employee_id' do
      @earning.employee_id = nil
      expect(@earning).to be_invalid
    end
  end

  describe 'model method' do
    it 'should have a valid list of updatable fields for import csv' do
      list = %w[earning_date amount]

      expect(described_class.updatable_fields).to eq(list), "You may want to exclude newly added earning column to updatable_fields or add in list above"
    end
  end

  describe 'model association' do
    it { should belong_to(:employee) }
  end
end
