class OrdersController < ApplicationController

  before_action :authenticate_user!

  def show 
    @order = Order.find(params[:id])
  end

  def index

    my_order()

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
            unit_amount: (@total*100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout',
            },
          },
          quantity: 1
        },
      ],
      metadata: {
        cart_id: @cart_id
      },
      mode: 'payment',
      success_url: sucess_order_url + '?session_id={ORDERS_SESSION_ID}',
      cancel_url: cancel_order_url
    )
    redirect_to @session.url, allow_other_host: true

  
      flash[:notice] = "commande effectuée"

    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @cart_id = @session.metadata.cart_id
  end

  def cancel
    
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

private

  def total 
    @total = 0
    @order.order_products.each do |product|
      @total = @total + (product.product.price * product.quantity)
    end

    @order.update(total: @total)
  end

  def my_order
    @orders = []
    Order.all.each do |order|
      if order.user_id == current_user.id
        @orders << order
      end
  end

  def joinproduct

  @cart = Cart.find_by(user_id: current_user.id)

  @cart.cart_products.each do |product|
    item = CartProduct.new(
      'product_id' => product.product_id,
      'quantity' => product.quantity,
      'order_id' => @order.id
    )
    if item.save
      puts "save"
      end
   end
  end

end

