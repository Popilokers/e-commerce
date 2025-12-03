class PaymentsController < ApplicationController
  def create_checkout_session

    # Calculate grand total from session
    cart = session[:cart] || []
    pst = session[:province_pst]
    gst = session[:province_gst] 
    hst = session[:province_hst] 

    tax = pst + gst + hst
    # Compute subtotal
    subtotal = cart.sum { |item| item["quantity"] * item["price"] }

    # Compute total including tax
    total_amount = (subtotal * (1 + tax.to_f)).round(2)

    # Stripe expects amount in cents
    amount_in_cents = (total_amount * 100).to_i

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'cad', # adjust as needed
          product_data: {
            name: 'Cart Checkout'
          },
          unit_amount: amount_in_cents
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: "#{root_url}success?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: "#{root_url}cancel"
    )

    Rails.logger.info "Stripe session: #{session.inspect}"


    redirect_to session.url, allow_other_host: true
  end

  def success
    session_id = params[:session_id]

    # Retrieve the Stripe Checkout session
    checkout_session = Stripe::Checkout::Session.retrieve(session_id)

    # Retrieve the PaymentIntent (actual payment)
    payment_intent_id = checkout_session.payment_intent

    # Now create the Order record in your DB
    order=Order.create!(
      customer_id: session[:customer_id],    # if applicable
      payment_id: payment_intent_id,
      total: session[:cart_total],
      pst: session[:province_pst],
      gst: session[:province_gst],
      hst: session[:province_hst],
      status: 0
    )
  session[:cart].each do |item|
    OrderItem.create!(
      order_id: order.id,
      product_id: item[:product_id] || item["product_id"], # support both symbols and strings
      quantity: item[:quantity] || item["quantity"],
      unit_price: item[:price] || item["price"],
      cost: (item[:price] || item["price"]) * (item[:quantity] || item["quantity"])
    )
  end

    # Clear the cart if needed
    session[:cart] = nil

    flash[:alert] = "Payment success!"

    redirect_to root_path
  end


  def cancel
    flash[:alert] = "Payment canceled!"
  end
end
