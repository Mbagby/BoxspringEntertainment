module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type.to_sym)} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end

  def get_employees_to_select_for(user, group)
    preselected_employee_ids = if group.persisted?
                                 user.group_employees.pluck(:employee_id)
                               else
                                 group.group_employees.pluck(:employee_id)
                               end
    data = if preselected_employee_ids.present?
             user.employees.where('id NOT IN (?)', preselected_employee_ids).map{|e| [e.full_name, e.id]}
           else
             user.employees.map{|e| [e.full_name, e.id]}
           end
    data
  end
end
