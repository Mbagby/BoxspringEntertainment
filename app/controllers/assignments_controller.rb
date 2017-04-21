class AssignmentsController < ApplicationController
  before_action :authenticate_user!
	before_action :check_user_type

  def index
    @group_assignments = Assignment.where(assignee_type: "Group")
    @employee_assignments = Assignment.where(assignee_type: "Employee")
  end

  def group_assignment
    @group = Group.find(params[:group_id]) if params[:group_id]
  end

  def create_group_assignment
    assignment = Assignment.new params_assignment
    assignment.save
    flash[:notice] = "Assignment created sucessfully."
    redirect_to :back
  end

  def select_content
    if params[:content_name] == "Category"
      @categories = Category.all
    elsif params[:content_name] == "Topic"
      @topics = Topic.all
    elsif params[:content_name] == "Season"
      @seasons = Season.all
    elsif params[:content_name] == "Episode"
      @episodes = Episode.all
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
