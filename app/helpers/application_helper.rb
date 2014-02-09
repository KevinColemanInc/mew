module ApplicationHelper
  def datetime_to_string(date_time)
    date_time.strftime('%-m/%e/%y %l:%M %P')
  end
end
