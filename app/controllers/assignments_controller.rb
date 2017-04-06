class AssignmentsController < ApplicationController
  before_action :authenticate_user!
	before_action :check_user_type

  def index
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
end
