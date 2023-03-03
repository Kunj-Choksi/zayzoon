class NumericUtils

  # expecting $ sign only with having scope of Canadians orgs
  def self.currency_to_number(currency_text)
    currency_text.gsub!('$', '')
    currency_text.gsub!(',', '')
    currency_text.gsub!(' ', '')
    currency_text.to_f
  end
end
