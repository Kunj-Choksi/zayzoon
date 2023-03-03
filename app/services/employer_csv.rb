require 'csv'

class EmployerCsv
  def self.import_csv(csv, employer_id)
    earning_records = CsvUtils.csv_to_list(csv)

    # we can pass format from this method params(instead of passing employer_id) from class instance like -- @employer.employer_data_format --- @employer var can be initialize during api auth
    csv_format = EmployerDataFormat.where(employer_id: employer_id).first

    earning_records.each do |record|
      map = {}

      Earning.updatable_fields.each do |field|
        map[field] = self.convert_value_by_type(record[csv_format.fields[field]['value']], csv_format.fields[field]['type'])     
      end

      employee = Employee.where(external_ref: map['employee_external_ref']).first
      employee.earnings.create!(map)
    end
  end

  def self.convert_value_by_type(value, type)
    case type
    when 'string'
      value.to_s.strip
    when 'date'
      DateTimeUtils.format_date(value)
    when 'float'
      NumericUtils.currency_to_number(value)
    else
      ''
    end
  end
end
