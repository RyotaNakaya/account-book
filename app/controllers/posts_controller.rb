class PostsController < ApplicationController
  require "date"
  layout "post"

  def index
    @title = "my家計簿ホーム"
    @newpostdata = Post.new
    date = Date.today
    @year = Date.today.strftime("%Y")
    @month = Date.today.strftime("%m")
    @ctg_array = Category.get_category_array
    def_ctg_id =  @ctg_array[0][1]
    @sub_ctg_array = Category.get_sub_category_array(def_ctg_id)
    @def_sub_ctg_id = @sub_ctg_array[0][1]
    # get_chart_by_month(@year, @month)
    @postdata = Post.order("created_at DESC").all.limit 5
  end

  def show
    # postdata = Post.order("created_at DESC").all.limit 5
    # Category.get_category_with_parent(@postdata)
    # return postdata
  end

  def create
    if request.post? then
      puts newpostdata_params
      Post.create(newpostdata_params)
    end
    goback
  end

  def edit
    @title = "家計簿修正"
    @postdata = Post.find(params[:id])
    @selected_sub_ctg_id = @postdata.category_id
    @selected_ctg_id = Category.get_parent_category_id(@selected_sub_ctg_id).parent_id
    @ctg_array = Category.get_category_array
    @sub_ctg_array = Category.get_sub_category_array(@selected_ctg_id)
  end

  def update
    obj = Post.find(params[:id])
    obj.update(postdata_params)
    redirect_to "/history"
  end

  def delete
    obj = Post.find(params[:id])
    obj.destroy
    redirect_to "/history"
  end

  def grid_input
      # 
  end

  # Ajax処理でカテゴリを取得する
  def change_ctg
    @ctg_array = Category.get_sub_category_array(params[:ctg_id].to_i)
    render json: { ctg_array: @ctg_array}
  end

  private
  def goback
    redirect_to("/posts")
  end

  def get_after_month(v, y, m)
    if (v == "prev_month")
      new_y = y
      new_m = m-1
      if (new_m == 0)
        new_y = y-1
        new_m = 12
      end
    else (v == "next_month")
      new_y = y
      new_m = m+1
      if (new_m == 13)
        new_y = y+1
        new_m = 1
      end
    end
    return {year: new_y, month: new_m}
  end

  def newpostdata_params
    params.require(:post).permit(:category_id, :amount, :booked_date, :remark)
  end

  def postdata_params
    params.require(:post).permit(:category_id, :amount, :booked_date, :remark)
  end

end
