class Product < ApplicationRecord
  has_many :cart_product
  has_many :carts, through: :cart_products
end
