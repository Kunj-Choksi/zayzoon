class CsvUtils

  # returns array of hash from csv
  def self.csv_to_list(file_obj)
    csv = CSV.new(file_obj, headers: true)

    list = []
    csv.each do |row|
      list << row.to_h
    end

    list
  end
end