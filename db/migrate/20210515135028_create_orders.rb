class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :order_price
      t.date :order_date
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :dealer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
