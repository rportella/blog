module ApplicationHelper
  def error_massages_for(resource)
    render "shared/error_massages_for", resourse: @post
  end
  def flash_messages
    flash.collect do |key, msg|
      content_tag(:p, msg, id: key, class: "flash_messagem")
    end.join.html_safe
  end
end
