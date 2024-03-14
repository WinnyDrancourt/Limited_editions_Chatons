class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
  end

  def index
    my_order
  end

  def create
    @total = params[:total].to_d
    @cart_id = params[:cart_id]
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total * 100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout'
            }
          },
          quantity: 1
        }
      ],
      metadata: {
        cart_id: @cart_id
      },
      mode: 'payment',
      success_url: sucess_order_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: cancel_order_url
    )
    redirect_to @session.url, allow_other_host: true

    order_creation
    order_product
    cart_product_destroy

    flash[:notice] = 'commande effectuée'
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @cart_id = @session.metadata.cart_id
  end

  def cancel; end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path
  end

  private

  def order_creation
    @order = Order.create!(user_id: current_user.id, stripe_customer_id: @session.id)
  end

  def order_product
    @cart.products.each do |product|
      OrderProduct.create!(order_id: @order.id, product_id: product.id)
    end
  end

  def cart_product_destroy
    @cart.products.delete_all
  end
end
