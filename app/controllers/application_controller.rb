class ApplicationController < ActionController::Base
  before_action :set_cart

  private

  def set_cart
    @cart = if current_user
              current_user.cart
            else
              Cart.new
            end
  end
end
