class HrManager::GroupEmployeesController < HrManager::BaseController
  before_action :find_group, only: [:create]
  before_action :find_group_employee, only: [:destroy]

  def create
    employee_ids = params[:group_employee][:employee_ids].reject(&:blank?) rescue []
    if employee_ids.blank?
      flash[:alert] = "Please select valid Employees."
    else
      group_employees = []
      employee_ids.each do |employee_id|
        group_employee = @group.group_employees.new(employee_id: employee_id)
        break unless group_employee.valid?
        group_employees << group_employee
      end
      if group_employees.count == employee_ids.count
        group_employees.map(&:save)
        flash[:success] = "Employees successfully added to Group."
      else
        flash[:alert] = "Unable to add employees. Please try later."
      end
    end
    redirect_to hr_manager_group_path(@group)
  end

  def destroy
    if @group_employee.destroy
      flash[:notice] = "Group Employee sucessfully removed."
    else
      flash[:error] = "Group Employee can not be removed."
    end
    redirect_to hr_manager_group_path(params[:group_id])
  end

  private
  def find_group
    @group = Group.find(params[:group_id]) rescue nil
    if @group.blank?
      redirect_to dashboard_groups_path
    end
  end

  def find_group_employee
    @group_employee = GroupEmployee.find(params[:id]) rescue nil
    if @group_employee.blank?
      redirect_to hr_manager_group_path(params[:group_id])
    end
  end
end
