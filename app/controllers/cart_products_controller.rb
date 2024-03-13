class CartProductsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_path
  end
end
