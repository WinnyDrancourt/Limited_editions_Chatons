class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :image_url, presence: true
  has_many :cart_products
  has_many :carts, through: :cart_products
  has_many :order_products

  has_one_attached :product_image
end
