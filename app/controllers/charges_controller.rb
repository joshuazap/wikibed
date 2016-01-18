class ChargesController < ApplicationController
  before_action :authenticate_user!

  # GET /charges/new
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Wikibed Monthly Subscription \n#{current_user.email}",
      amount: 9_99
    }
  end

  # POST /charges
  # POST /charges.json
  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    subscription = customer.subscriptions.create(plan: "1021")

    current_user.stripeid = customer.id
    current_user.stripesubscriptionid = subscription.id
    current_user.subscribed = true
    current_user.premium!
    current_user.save!

    flash[:notice] = "Thanks for subscribing, #{current_user.email}!"
    redirect_to wikis_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  # PATCH/PUT /charges/1
  # PATCH/PUT /charges/1.json
  def update
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @charge, notice: 'Charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @charge }
      else
        format.html { render :edit }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripeid)
    subscription = customer.subscriptions.retrieve(current_user.stripesubscriptionid)

    if subscription
      customer.subscriptions.retrieve(subscription.id).delete
      current_user.stripeid = customer.id
      current_user.stripesubscriptionid = nil
      current_user.subscribed = false
      current_user.standard!
      current_user.save!

      flash[:notice] = "You have unsubscribed, #{current_user.email}!"
      redirect_to wikis_path
    else
      flash[:notice] = "You do not have any active subscriptions."
      redirect_to wikis_path
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:customer, :amount, :description, :currency)
    end
end
