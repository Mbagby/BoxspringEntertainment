class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  def new
    super
  end

  def create
    super do
        resource.assign_attributes(sign_up_params)
        resource.save
    end
  end

  def update
    super
  end

  private
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :company_id, :employee_id, :password, :password_confirmation, :user_type)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :company_id, :employee_id, :password, :password_confirmation, :user_type)
    end
end
