class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def dashboard
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :company_id,
      :employee_id,
      :avatar
    )
  end

end
