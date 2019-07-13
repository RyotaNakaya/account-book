class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.integer :amount
      t.date :booked_date
      t.integer :unit
      t.integer :currency_unit
      t.integer :exchange_rate
      t.text :remark
      t.text :store

      t.timestamps
    end
  end
end
