require 'rails_helper'

RSpec.describe EmployerCsv do
  it 'should increase count of earnings' do
    csv = CSV.new(File.read('acme_earnings.csv'), headers: true)
    expect { EmployerCsv.parse_csv(File.read('acme_earnings.csv'), Employer.first.id) }.to change(Earning, :count).by(csv.count)
  end
end
