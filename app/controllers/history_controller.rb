class HistoryController < ApplicationController
  layout "application"

  def index
    @title = "my家計簿履歴"
    # @year_month = Date.today.strftime("%Y-%m")
    @year = Date.today.strftime("%Y")
    @month = Date.today.strftime("%-m")
    @chart_datas = get_chart_by_month(@year, @month)
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
    @chart_datas = get_chart_by_month(@year, @month)
    @allpostdata = show_by_month(@year, @month)
    render
  end

  def get_chart_by_month(y, m)
    chart_datas = Array.new
    ctg_mst = Category.get_all_category
    sub_ctg_mst = Category.get_all_sub_category
    # all_postdata = Post.where(booked_date: d.beginning_of_month..d.end_of_month)
    all_postdata = Post.where("DATE_FORMAT(booked_date, '%Y') = ? AND DATE_FORMAT(booked_date, '%c') = ?", y.to_s, m.to_s)
    all_amounts = Post.where("DATE_FORMAT(booked_date, '%Y') = ? AND DATE_FORMAT(booked_date, '%c') = ?", y.to_s, m.to_s).sum("amount")
    if (all_amounts.to_f != 0)
      for ctg in ctg_mst do
        category_id = ctg.id
        # puts "カテゴリIDは"
        # puts category_id
        chart_data = Array.new
        amount_by_category = 0
        for obj in all_postdata do
          # puts "ポストデータのカテゴリIDは"
          # puts obj.category_id
          parent_id = Category.get_parent_category_id(obj.category_id).parent_id
          # puts "取得した親はID"
          # puts parent_id
          if (parent_id == category_id)
            amount_by_category += obj.amount
          end
        end
        rate = ((amount_by_category / all_amounts.to_f) * 100).round(2)
        chart_datas.push(chart_data.push(ctg.ctg_name, amount_by_category, rate))
      end
      return chart_datas
    else
        # return false#データが0件だった時の処理
    end
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
