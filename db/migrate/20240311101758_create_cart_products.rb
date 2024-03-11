class CreateCartProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_products do |t|
      t.belongs_to :cart, foreign_key: true, index: true
      t.belongs_to :product, foreign_key: true, index: true
      t.timestamps
    end
  end
end
