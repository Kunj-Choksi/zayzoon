require 'rails_helper'

RSpec.describe NumericUtils do
  context 'currency to float' do
    it 'should covert currency string to float -- $ prefix' do
      expect(NumericUtils.currency_to_number("$3600")).to eq(3600)  
      expect(NumericUtils.currency_to_number("$3600.9")).to eq(3600.9)  
      expect(NumericUtils.currency_to_number("$3600,  49.9")).to eq(360049.9)
      expect(NumericUtils.currency_to_number("36,000.5")).not_to eq(36.0)
    end

    it 'should covert currency string to float -- $ postfix' do
      expect(NumericUtils.currency_to_number("3600.9$")).to eq(3600.9)  
      expect(NumericUtils.currency_to_number("3600.9 $")).to eq(3600.9)  
      expect(NumericUtils.currency_to_number("3600.9   $")).to eq(3600.9)  
      expect(NumericUtils.currency_to_number("3600.   9   $")).to eq(3600.9)  
      expect(NumericUtils.currency_to_number("36,00.9$")).to eq(3600.9)  
    end
  end
end
