require 'csv'

class EmployerCsv
  def self.parse_csv (csv, employer_id)
    earning_records = CsvUtils.csv_to_list(csv)

    # we can pass format from this method params(instead of passing employer_id) from class instance like -- @employer.employer_data_format --- @employer var can be initialize during api auth
    csv_format = EmployerDataFormat.where(employer_id: employer_id).first

    earning_records.each do |record|
      emp_id_val = record[csv_format.employee_id]
      e_date = DateTimeUtils.format_date(record[csv_format.earning_date])
      e_amount = NumericUtils.currency_to_number(record[csv_format.earning_amount])

      employee = Employee.where(external_ref: emp_id_val).first

      employee.earnings.create(employee_external_ref: emp_id_val, earning_date: e_date, amount: e_amount)
    end
  end
end
