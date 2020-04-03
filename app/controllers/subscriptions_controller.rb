class SubscriptionsController < ApplicationController
    load_and_authorize_resource

    def index
      #show only 1 subscription, the latest active one.
       @subscription = @subscriptions.where(canceled: false).first
    end

    def destroy
      subscription_id = @subscription.stripe_token
      puts subscription_id
      cancelled_sub = Stripe::Subscription.delete(subscription_id)
      puts cancelled_sub.inspect
      if cancelled_sub.status == 'canceled'
        @subscription.update(canceled: true)
        @current_user.remove_role :polimeter_premium
      else
        puts 'error canceling subscription'
      end
        redirect_to :action => :index, status: 303    
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :invite_code);
    end

end
