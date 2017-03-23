class DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :check_user_type
	def index
  end

  def forum
  end

  def videos
  end
	def asset_libraries
	end

	# POST dashboard/upload_file
  def upload_file
		asset_library = current_user.asset_libraries.new(file:params[:file])
		asset_library.save
		redirect_to dashboard_asset_libraries_path
	end
	# DELETE dashboard/destroy_file
	def destroy_file
		asset_library = current_user.asset_libraries.find(params[:id])
		asset_library.destroy
		redirect_to dashboard_asset_libraries_path
	end
	private
	def check_user_type
		unless current_user.user_type == "hr_manager"
			flash[:notice] = "HR_Managers only can access dashboard page"
			redirect_to root_path
		else
			true
		end
	end
end
