class ChargesController < ApplicationController

  def create
    if current_user.upgradeable? 
      customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
      )
     
      charge = Stripe::Charge.create(
        customer: customer.id, # Note -- this is NOT the user_id in your app
        amount: 1500,
        description: "Premium Membership - #{current_user.email}",
        currency: 'usd'
      )
     
      current_user.update_attribute :role, "premium"
      
      flash[:success] = "#{current_user.email}! Premium member status set."
      redirect_to user_path(current_user) # or wherever
     
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
      
    else
      flash[:error] = "Already a premium account"
      redirect to wikis_path
    end
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.name}",
      amount: 1500
    }
  end 

end
