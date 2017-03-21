class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
  end

  def show
  end

  def profile
  end

  def update
		@user = current_user
		respond_to do |format|
			if @user.update_attributes(user_params)
				format.html{ redirect_to profile_user_path(@user), notice: "Updated profile successfully"}
				format.json{ render :profile, status: :updated, location: @user}
			else
				format.html{ render :profile}
				format.json{ render json: :@user.errors, status: :unprocessable_entity}
			end
		end
  end

  def dashboard
  end

	private
  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :company_id,
      :employee_id,
      :avatar
    )
  end

end
