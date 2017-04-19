class GroupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = current_user.groups.new
  end

  def create
    group = current_user.groups.new(group_params)
    group.save
    employee_ids = params[:employee_ids].reject(&:blank?) rescue []
    if employee_ids.present?
      employee_ids.each do |employee_id|
        group_employee = group.group_employees.new(employee_id: employee_id)
      end
    end
    flash[:notice] = "Group created sucessfully."
    redirect_to dashboard_groups_path
  end

  def group_params
    params.require(:group).permit(:name)
  end

end
