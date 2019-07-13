class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :ctg_name
      t.string :disp_orderinteger
      t.boolean :sub_flg
      t.integer :parent_id
      t.integer :user_id

      t.timestamps
    end
  end
end
