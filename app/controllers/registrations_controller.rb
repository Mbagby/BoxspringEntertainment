class RegistrationsController < Devise::RegistrationsController
  # before_action :authenticate_user!
  def new
    super
  end

  def create
    if params[:stripe_token].present?
      plan = Plan.find_by_name params[:plan]
      Stripe.api_key = Rails.application.secrets.stripe_secret_key
      customer = Stripe::Customer.create email: params[:user][:email], card: params[:stripe_token], plan: plan.name
      # Stripe::Charge.create customer: customer.id, amount: plan.amount, description: plan.name, currency: 'usd'
      if customer.id.present?
        super do
          resource.assign_attributes(sign_up_params)
          resource.assign_attributes(card_token:params[:stripe_token], end_date: Date.today + 1.month, plan_id:plan.id, customer_id:customer.id)
          resource.user_type = "single_user"
          resource.save
        end
      else
        redirect_to new_registration_path(:user, plan:"silver"), "Please check your card info again"
      end
    else
      redirect_to new_registration_path(:user, plan:"silver"), "Please input the card info"
    end
  end

  def update
    super
  end

  private
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :company_id, :employee_id, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :company_id, :employee_id, :password, :password_confirmation)
    end
end
