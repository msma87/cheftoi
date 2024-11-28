module ApplicationHelper
  def flash_class_for(key)
    case key.to_sym
    when :notice
      "info"
    when :alert
      "warning"
    when :success
      "success"
    when :error, :danger
      "danger"
    else
      "info"
    end
  end
end
