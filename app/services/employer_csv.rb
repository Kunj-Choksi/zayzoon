require 'csv'

class EmployerCsv
  attr_accessor :csv_format

  def self.import_csv(csv, employer_id, format)
    earning_records = CsvUtils.csv_to_list(csv)
    @csv_format = format

    earning_records.each do |record|
      map = {}

      Earning.updatable_fields.each do |field|
        record_key_name = get_attr_by_param(field, 'value')
        record_value_type = get_attr_by_param(field, 'type')

        map[field] = convert_value_by_type(record[record_key_name], record_value_type)
      end

      employee_external_ref_text = get_attr_by_param('employee_external_ref', 'value')
      employee_external_ref_type = get_attr_by_param('employee_external_ref', 'type')

      ext_ref_col_name = convert_value_by_type(record[employee_external_ref_text], employee_external_ref_type)

      employee = Employee.where(external_ref: ext_ref_col_name, employer_id:).first

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

  def self.get_attr_by_param(field, param)
    @csv_format.fields[field][param]
  end
end
