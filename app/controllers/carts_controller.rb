class CartsController < ApplicationController
  def show
    @cart = Cart.find(params['id'])
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
  end

  private

  def cart_params
    cart_params = params.require(:cart).permit(:user, :product)
    cart_params[:product] = Product.find(cart_params[:product].to_i)
    cart_params[:user] = User.find(cart_params[:user].to_i)
    cart_params
  end
end
