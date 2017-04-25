class AssignmentsController < ApplicationController
  before_action :authenticate_user!
	before_action :check_user_type

  def index
    @group_assignments = Assignment.group_assignments
    @employee_assignments = Assignment.employee_assignments
  end

  def new
    @groups = current_user.groups
    @employees = current_user.employees
  end

  def create
    params[:assignment][:groups_ids].delete("")
    params[:assignment][:employees_ids].delete("")
    create_group_assignment
    create_employee_assignment
    flash[:notice] = "Assignment created sucessfully."
    redirect_to dashboard_groups_path
  end

  def create_group_assignment
    params[:assignment][:groups_ids].each do |group_id|
      params[:assignment][:assignee_id] = group_id
      params[:assignment][:assignee_type] = "Group"
      if !Assignment.group_assignments.map{|a| [ a.assignee_id, a.assignee_type, a.content_id , a.content_type] }.uniq.include?( [ params[:assignment][:assignee_id].to_i , params[:assignment][:assignee_type], params[:assignment][:content_id].to_i, params[:assignment][:content_type]]  )
        group_assignment = Assignment.new params_assignment
        group_assignment.save
      end
    end
  end

  def create_employee_assignment
    params[:assignment][:employees_ids].each do |employee_id|
      params[:assignment][:assignee_id] = employee_id
      params[:assignment][:assignee_type] = "User"
      if !Assignment.employee_assignments.map{|a| [ a.assignee_id, a.assignee_type, a.content_id , a.content_type] }.uniq.include?( [ params[:assignment][:assignee_id].to_i , params[:assignment][:assignee_type], params[:assignment][:content_id].to_i, params[:assignment][:content_type]]  )
        employee_assignment = Assignment.new params_assignment
        employee_assignment.save
      end
    end
  end

  def select_content
    if params[:content_name] == "Category"
      @content = Category.all
    elsif params[:content_name] == "Topic"
      @content = Topic.all
    elsif params[:content_name] == "Season"
      @content = Season.all
    elsif params[:content_name] == "Episode"
      @content = Episode.all
    end
    respond_to do  |formate|
      formate.js
    end
  end

	private
  	def check_user_type
  		unless current_user.user_type == "hr_manager"
  			flash[:notice] = "HR_Managers only can access assignments page"
  			redirect_to root_path
  		else
  			true
  		end
  	end

    def params_assignment
      params.require(:assignment).permit(:assignee_id, :assignee_type, :content_type, :content_id, :hr_manager_id)
    end
end
