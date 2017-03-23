class HomeController < ApplicationController
  def select_box
  end

  def set_card_info
  end

  def contact
    render :layout => false
  end

  # POST /home/hook
  protect_from_forgery except: :hook
  def hook
    Stripe.api_key = Rails.application.secrets.stripe_secret_key
    p "api_key = #{Stripe.api_key}"
    event = Stripe::Event.retrieve(params["id"])
    p "event --->#{event}"
    case event.type
      when "invoice.payment_succeeded" #renew subscription
        User.find_by_customer_id(event.data.object.customer).renew
    end
    render status: :ok, json: "success"
  end
end
