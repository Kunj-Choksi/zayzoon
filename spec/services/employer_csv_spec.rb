require 'rails_helper'

RSpec.describe EmployerCsv do
  it 'should increase count of earnings' do
    csv = CSV.new(File.read('acme_earnings.csv'), headers: true)
    employer = Employer.first
    employer_data_format = employer.employer_data_format
    expect { EmployerCsv.import_csv(File.read('acme_earnings.csv'), employer.id, employer_data_format) }.to change(Earning, :count).by(csv.count)
  end
end
