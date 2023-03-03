class DateTimeUtils
  # 2nd approach -- relying chronic to handle logic

  def self.format_date(str, format = nil)
    if format.present?
      begin
        Date.strptime(str, format)
      rescue StandardError
        nil
      end
    else
      begin
        Chronic.parse(str).to_date
      rescue StandardError
        nil
      end
    end
  end
end
