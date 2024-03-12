class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products

  def add_product(product)
    current_product = cart_products.build(product:)
    current_product.save
  end

  def total_price
    cart_products.sum { |cart_product| cart_product.product.price }
  end
end
