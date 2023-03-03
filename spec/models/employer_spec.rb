require 'rails_helper'

RSpec.describe Employer, type: :model do
  describe 'model validation' do
    before do
      @employer = Employer.create(name: 'AcmeCo')
    end

    it 'should be valid with attrs' do
      expect(@employer).to be_valid
    end

    it 'should be invalid without name' do
      @employer.name = nil
      expect(@employer).to be_invalid
    end
  end

  describe 'model association' do
    it { should have_one(:employer_data_format) }
  end
end
