class SubscribersController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def update

    token = params[:stripeToken]

    customer = Stripe::Customer.create(
      card: token,
      email: current_user.email,
      plan: 1021
    )

    current_user.subscribed = true
    current_user.stripeid = customer.id
    current_user.premium!
    current_user.save!

    flash[:notice] = "Thanks for subscribing, #{current_user.name}!"
    redirect_to wikis_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_subscribers_path
  end
end
#