class HrManager::GroupsController < HrManager::BaseController
  before_action :find_group, only: [:show, :destroy]

  def index
    groups = current_user.groups
    @groups = Kaminari.paginate_array(groups).page(params[:page]).per(5)
  end

  def new
    @group = current_user.groups.new
  end

  def show
    group_employees = @group.group_employees
    @group_employees = Kaminari.paginate_array(group_employees).page(params[:page]).per(5)
  end

  def create
    group = current_user.groups.new(group_params)
    
    if group.save
      
      employee_ids = params[:employee_ids].reject(&:blank?) rescue []
      if employee_ids.present?
        employee_ids.each do |employee_id|
          group_employee = group.group_employees.create(employee_id: employee_id)
        end
      end
      redirect_to hr_manager_groups_path, notice: "Group created sucessfully."
    else
      render :new  
    end  
  end

  def destroy
    if @group.destroy
      flash[:notice] = "Group sucessfully removed."
    else
      flash[:error] = "Group can not be removed."
    end
    redirect_to hr_manager_groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def find_group
    @group = Group.where(id: params[:id]).first
    redirect_to hr_manager_groups_path unless @group
  end
end
