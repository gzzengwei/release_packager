module ApplicationHelper
  def formatted_datetime(date_time)
  	date_time.strftime('%d/%m/%Y %I:%m %p')
  end
end
