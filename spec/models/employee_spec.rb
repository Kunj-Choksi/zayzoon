require 'rails_helper'

RSpec.describe Employee, type: :model do
  before do
    employer = Employer.create(name: 'AcmeCo')

    @employee = employer.employees.create(name: 'John', external_ref: 'A123')
  end

  describe 'model validation' do
    it 'should be valid with attrs' do
      expect(@employee).to be_valid
    end

    it 'should be invalid without name' do
      @employee.name = nil
      expect(@employee).to be_invalid
    end

    it 'should be invalid without external_ref' do
      @employee.external_ref = nil
      expect(@employee).to be_invalid
    end
  end

  describe 'model association' do
    it { is_expected.to have_many(:earnings) }
  end
end
