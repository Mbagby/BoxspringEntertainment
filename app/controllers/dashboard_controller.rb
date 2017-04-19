class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_type

  def index
  end

  def forum
  end

  def videos
  end

  def permission
  end

  def update_permission
    @category = Category.find(params[:category_id])
    @category_option = CategoryOption.find_or_create_by(category_id: @category.id)
    @category_option.update_attributes(user_id:current_user.id,message_board:params[:message_board],comment_section:params[:comment_section])
    render json: {status: "success"}
  end

  def asset_libraries
    @asset_libraries = current_user.asset_libraries
    @asset_libraries = Kaminari.paginate_array(@asset_libraries).page(params[:page]).per(5)
    # @asset_libraries = current_user.asset_libraries.paginate(:page => params[:page], :per_page => 10)
    # @asset_libraries = current_user.asset_libraries
  end

  # POST dashboard/upload_file
  def upload_file
    asset_library = current_user.asset_libraries.new(file:params[:file], category_id:params[:category])
    asset_library.save
    redirect_to dashboard_asset_libraries_path
  end
  # DELETE dashboard/destroy_file
  def destroy_file
    asset_library = current_user.asset_libraries.find(params[:id])
    asset_library.destroy
    redirect_to dashboard_asset_libraries_path
  end

  def groups
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
