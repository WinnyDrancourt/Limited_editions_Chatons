class Order < ApplicationRecord
    after_create :order_confirmation_send

    belongs_to :user
    has_many :order_products
    has_many :products, through: :order_products

    def order_confirmation_send
        UserMailer.order_confirmation(self.user).deliver_now
    end
end
