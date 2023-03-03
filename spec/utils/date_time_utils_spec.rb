require 'rails_helper'
require 'csv'

RSpec.describe DateTimeUtils do
  describe 'format_date' do
    it 'should parse date with format' do
      expect(DateTimeUtils.format_date('14/10/2021   ', '%d/%m/%Y')).to eq(Date.new(2021, 10, 14))
      expect(DateTimeUtils.format_date('10/14/2021', '%m/%d/%Y')).to eq(Date.new(2021, 10, 14))
      expect(DateTimeUtils.format_date('14 Oct 2021', '%m/%d/%Y')).to be_nil
      expect(DateTimeUtils.format_date('14/10/   2021   ', '%d/%m/%Y')).to be_nil
    end
    
    it 'should parse date without format' do
      expect(DateTimeUtils.format_date('14/10/2021')).to eq(Date.new(2021, 10, 14))
      expect(DateTimeUtils.format_date('14 Oct 2021')).to eq(Date.new(2021, 10, 14))
      expect(DateTimeUtils.format_date('14 10 2021')).to be_nil
      expect(DateTimeUtils.format_date('14 10, 2021')).to be_nil
    end
  end
end
