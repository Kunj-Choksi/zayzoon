require 'csv';
class CsvUtils

  # returns array of hash from csv
  def self.csv_to_list(file_obj)
    csv = CSV.new(file_obj, headers: true)

    csv.map(&:to_h)
  end
end