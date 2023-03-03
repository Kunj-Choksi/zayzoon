require 'rails_helper'

RSpec.describe EmployerDataFormat, type: :model do
  before do
    employer = Employer.create(name: 'AcmeCo')

    @employer_data_format = employer.create_employer_data_format(employee_id: "EmployeeNumber", earning_date: "CheckDate", earning_amount: "Amount")
  end

  describe 'model validation' do
    it 'should be valid with attrs' do
      expect(@employer_data_format).to be_valid
    end

    it 'should be invalid without employee_id' do
      @employer_data_format.employee_id = nil
      expect(@employer_data_format).to be_invalid
    end

    it 'should be invalid without earning_date' do
      @employer_data_format.earning_date = nil
      expect(@employer_data_format).to be_invalid
    end
    
    it 'should be invalid without earning_amount' do
      @employer_data_format.earning_amount = nil
      expect(@employer_data_format).to be_invalid
    end
  end

  describe 'model association' do
    it { should belong_to(:employer) }
  end
end
