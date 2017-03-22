class RegistrationsController < Devise::RegistrationsController
  # before_action :authenticate_user!
  def new
    super
  end

  def create
    if params[:stripe_token].present?
      super do
          resource.assign_attributes(sign_up_params)
          resource.save
      end
    else
      redirect_to new_registration_path(:user), "Please input the card info"
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
