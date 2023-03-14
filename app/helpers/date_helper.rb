module DateHelper
  def parse_date_or_get_today(date)
    Date.parse(date)
  rescue StandardError
    Date.today
  end
end
