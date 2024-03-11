class AddReferencesProductId < ActiveRecord::Migration[7.1]
  def change
    add_reference :cart_products, :product, foreign_key: true, index: true
  end
end
