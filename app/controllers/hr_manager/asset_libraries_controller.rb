class HrManager::AssetLibrariesController < HrManager::BaseController
  def index
    @asset_libraries = current_user.asset_libraries
    @asset_libraries = Kaminari.paginate_array(@asset_libraries).page(params[:page]).per(5)
  end

  def upload_file
    asset_library = current_user.asset_libraries.new(file:params[:file], category_id:params[:category])
    asset_library.save
    redirect_to hr_manager_asset_libraries_path
  end

  def destroy_file
    asset_library = current_user.asset_libraries.find(params[:id])
    asset_library.destroy
    redirect_to hr_manager_asset_libraries_path
  end
end