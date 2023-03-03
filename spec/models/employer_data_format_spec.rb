require 'rails_helper'

RSpec.describe EmployerDataFormat, type: :model do
  describe 'model validation' do
    before do
      employer = Employer.create(name: 'AcmeCo')
      format = { employee_external_ref: 'EmployeeNumber', earning_date: 'CheckDate', amount: 'Amount' }
  
      @employer_data_format = employer.create_employer_data_format(fields: format)
    end

    it 'should be valid with attrs' do
      expect(@employer_data_format).to be_valid
    end

    it 'should have valid json fields attrs' do
      expect(@employer_data_format.fields.keys).to eq(Earning.updatable_fields)
    end
  end

  describe 'model association' do
    it { should belong_to(:employer) }
  end
end
