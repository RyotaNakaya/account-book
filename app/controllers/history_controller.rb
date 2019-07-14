class HistoryController < ApplicationController

  def index
    @title = "my家計簿履歴"
    # @year_month = Date.today.strftime("%Y-%m")
    @year = Date.today.strftime("%Y")
    @month = Date.today.strftime("%-m")
    @allpostdata = show_by_month(@year, @month)
  end

  def show
    # postdata = Post.order("created_at DESC").all.limit 5
    # Category.get_category_with_parent(@postdata)
    # return postdata
  end

  def show_by_month(y, m)
    postdata = Post.where("DATE_FORMAT(booked_date, '%Y') = ? AND DATE_FORMAT(booked_date, '%c') = ?", y.to_s, m.to_s).order("booked_date DESC, created_at DESC")
    return postdata
  end

  # Ajax処理で月の変更後の結果を取得する
  def change_month
    v = params[:button]
    y = params[:this_year].to_i
    m = params[:this_month].to_i
    # ここで変更後の月と年を取得
    after_data = get_after_month(v, y, m)
    @year = after_data[:year]
    @month = after_data[:month]
    @allpostdata = show_by_month(@year, @month)
    render
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

end
