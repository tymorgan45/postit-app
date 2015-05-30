module ApplicationHelper
  def fix_url(str)
    str.starts_with?("http://") ? str : "http://#{str}"
  end

  def display_date(dt)
    dt.strftime("%m/%d/%Y %H:%M")
  end
end
