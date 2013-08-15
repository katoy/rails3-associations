module ApplicationHelper

  def hbr(str)
    h(str).gsub(' ', '&nbsp;').gsub(/(\r\n?)|(\n)/, '<br/>').html_safe
  end
end
