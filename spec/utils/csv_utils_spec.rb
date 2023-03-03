require 'rails_helper'
require 'csv'

RSpec.describe CsvUtils do
  
  it "should convert csv file to list of hashmaps" do
    result = [{"EmployeeNumber"=>"A123", "CheckDate"=>"12/14/2021", "Amount"=>"$801.50"}, {"EmployeeNumber"=>"B456", "CheckDate"=>"12/21/2021", "Amount"=>"$740.00"}]

    expect(CsvUtils.csv_to_list(File.read('acme_earnings.csv'))).to eq(result)  
  end
end
