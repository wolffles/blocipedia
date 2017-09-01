class ChargesController < ApplicationController
before_action :premium?, only: :new

  def create
     # Creates a Stripe Customer object, for associating
     # with the charge
     customer = Stripe::Customer.create(
       email: current_user.email,
       card: params[:stripeToken]
     )

     # Where the real magic happens
     charge = Stripe::Charge.create(
       customer: customer.id, # Note -- this is NOT the user_id in your app
       amount: Amount.default,
       description: "Blocipedia Membership - #{current_user.email}",
       currency: 'usd'
     )

     flash[:notice] = "Thanks, #{current_user.email}! your payment is much appreciated."
     current_user.update_attribute(:role, 'premium') #update_attribute is a active_records method, I added both ways as a reminder to myself.
     #current_user.role = :premium
     #current_user.save!
     redirect_to account_path

     # Stripe will send back CardErrors, with friendly messages
     # when something goes wrong.
     # This `rescue block` catches and displays those errors.
     # => is like  e = CardError.new *creating a new instance of that class object*
     rescue Stripe::CardError => e
       flash[:alert] = e.message
       redirect_to new_charge_path
   end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia Membership - #{current_user.email}",
      amount: Amount.premium
    }
  end

private

  def premium?
    if current_user.role == "premium"
      flash[:notice] = "Hey there buddy, did you know you're already a premium member?"
      redirect_to account_path
    end
  end
end
