class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:add]
  def show; end

  def destroy
    @cart.destroy
    redirect_to cart_path
  end

  def add
    @product = Product.find(params[:product_id])
    @cart = current_user.cart || current_user.create_cart
    @cart.add_product(@product)
  end
end
