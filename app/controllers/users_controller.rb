class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  	before_action :ensure_correct_user, only: [:show,:edit, :update, :destroy]
  
  def index
    @categories = Category.all 
  end

  def show
    @user = User.find_by_id(session[:user_id])
  end

  def edit
  end

  def update
    @user = User.find_by_id(session[:user_id])
    @user.avatar = params[:user][:avatar]
    @user.update_attribute(:avatar, @user.avatar)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy && session[:user_id] = nil
    redirect_to root_path, flash: {success: "#{@user.username} deleted"}
  end

  def set_user
    @user = User.find params[:id]
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

  def ensure_correct_user
    # compare some params vs something in the session/current_user
    unless params[:id].to_i == session[:user_id]
      redirect_to root_path, alert: "Not Authorized"
    end
  end

end
