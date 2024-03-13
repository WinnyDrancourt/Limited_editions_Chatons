class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :stripe_customer_id
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
