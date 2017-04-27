class HrManager::BaseController < ApplicationController
  before_action :authenticate_hr_manager

  protected
  def authenticate_hr_manager
    unless current_user.present? && current_user.hr_manager?
      flash[:error] = "Only Hr Manager can access this page."
      redirect_to root_path
    end
  end
end
