module DateHelper
  def parse_date_or_get_today(date)
    Date.parse(date)
  rescue StandardError
    Time.zone.today
  end
end
