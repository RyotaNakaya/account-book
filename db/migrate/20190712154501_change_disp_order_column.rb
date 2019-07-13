class ChangeDispOrderColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :categories, :disp_orderinteger, :disp_order
    change_column :categories, :disp_order, :integer
  end
end
