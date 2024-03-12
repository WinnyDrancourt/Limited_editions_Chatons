class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:add]
  def show
    @cart = current_user.cart
  end

  def destroy
    @cart = current_user.cart
    @cart.destroy
    redirect_to cart_path
  end

  def add
    @product = Product.find(params[:product_id])
    @cart = current_user.cart || current_user.create_cart
    @cart.add_product(@product)
    redirect_to cart_path
  end

  def remove
    CartProduct.find_by(id: params[:id]).destroy
  end
end
