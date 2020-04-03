class StripeHooksController < ActionController::API
  def hook
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, ENV['STRIPE_WEBHOOK_SECRET']
      )

      rescue JSON::ParserError => e
        # Invalid payload
        status 400
        return

      rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        status 400
        return
    end

  case event.type
    when "invoice.payment_succeeded" #renew subscription
      puts 'invoice payment succeeded'
      response = event.data.object
      user = User.find_by_email(response.customer_email)
      if user
        puts event.data.object.subscription
        subscription = Subscription.find_by_stripe_token(response.subscription)
        puts subscription
        if subscription
          subscription.renew
        else
          subscription = Subscription.create(stripe_token: response.subscription, stripe_customer_id: response.customer, plan_id: 1, user_id: user.id, end_date: Date.today + 1.month, canceled: false  )
          user.add_role :polimeter_premium
        end
          puts subscription.errors.inspect
      end
    end
  render status: :ok, json: "success"
  end


  def show


  end

end
