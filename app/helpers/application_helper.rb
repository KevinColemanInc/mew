module ApplicationHelper
  def datetime_to_string(date_time)
    date_time.strftime('%a %b %d %H:%M:%S %Z %Y')
  end
end
