class AddImageUrlAndDescriptionToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :image_url, :string
    add_column :products, :description, :text
    change_column :products, :price, :float
  end
end
