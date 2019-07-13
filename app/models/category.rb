class Category < ApplicationRecord
  has_many :children, :class_name => "Category", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Category", optional: true

  def self.get_all_category
    ctg = Category.where("sub_flg=?", 0).order("disp_order ASC")
    return ctg
  end

  def self.get_all_sub_category
    ctg = Category.where("sub_flg=?", 1).order("disp_order ASC")
    return ctg
  end

  def self.get_parent_category_id(sub_ctg_id)
    parent_id = Category.select("parent_id").find(sub_ctg_id)
    return parent_id
  end

  def self.get_category_array
    ctg = Category.where("sub_flg=?", 0).order("disp_order ASC").all
    ctg_array = to_array_name_with_id(ctg)
    return ctg_array
  end

  def self.get_sub_category_array
    ctg = Category.where("sub_flg=?", 1).order("disp_order ASC").all
    sub_ctg_array = to_array_name_with_id(ctg)
    return sub_ctg_array
  end

  def self.get_sub_category_array(parent_id)
    ctg = Category.where("parent_id=?", parent_id).order("disp_order ASC").all
    sub_ctg_array = to_array_name_with_id(ctg)
    return sub_ctg_array
  end


  def self.to_array_name_with_id(a)
    array = Array.new
    for obj in a do
      array.push(Array.new([obj.ctg_name, obj.id]))
    end
    return array
  end

end
