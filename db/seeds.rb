# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8
# Category.delete_all

# Category.create!(ctg_name:"食費", disp_order: 1, sub_flg: 0)
# Category.create!(ctg_name:"日用雑貨", disp_order: 2, sub_flg: 0)
# Category.create(ctg_name:"交通費", disp_order: 3, sub_flg: 0)
# Category.create(ctg_name:"交際費", disp_order: 4, sub_flg: 0)
# Category.create(ctg_name:"エンタメ", disp_order: 5, sub_flg: 0)
# Category.create(ctg_name:"教育・教養", disp_order: 6, sub_flg: 0)

Category.create(ctg_name:"朝食", sub_flg: 1, disp_order: 1, parent_id:1)
Category.create(ctg_name:"昼食", sub_flg: 1, disp_order: 2, parent_id:1)
Category.create(ctg_name:"夕食", sub_flg: 1, disp_order: 3, parent_id:1)
Category.create(ctg_name:"食料品", sub_flg: 1, disp_order: 4, parent_id:1)
Category.create(ctg_name:"消耗品", sub_flg: 1, disp_order: 1, parent_id:2)
Category.create(ctg_name:"子供関連", sub_flg: 1, disp_order: 2, parent_id:2)
Category.create(ctg_name:"ペット関連", sub_flg: 1, disp_order: 3, parent_id:2)
Category.create(ctg_name:"タクシー", sub_flg: 1, disp_order: 1, parent_id:3)
Category.create(ctg_name:"鉄道", sub_flg: 1, disp_order: 2, parent_id:3)
Category.create(ctg_name:"バス", sub_flg: 1, disp_order: 3, parent_id:3)
Category.create(ctg_name:"飛行機", sub_flg: 1, disp_order: 4, parent_id:3)
Category.create(ctg_name:"飲み会", sub_flg: 1, disp_order: 1, parent_id:4)
Category.create(ctg_name:"プレゼント", sub_flg: 1, disp_order: 2, parent_id:4)
Category.create(ctg_name:"ご祝儀・香典", sub_flg: 1, disp_order: 3, parent_id:4)
Category.create(ctg_name:"レジャー", sub_flg: 1, disp_order: 1, parent_id:5)
Category.create(ctg_name:"イベント", sub_flg: 1, disp_order: 2, parent_id:5)
Category.create(ctg_name:"映画", sub_flg: 1, disp_order: 3, parent_id:5)
Category.create(ctg_name:"書籍", sub_flg: 1, disp_order: 4, parent_id:5)
Category.create(ctg_name:"習い事", sub_flg: 1, disp_order: 1, parent_id:6)
Category.create(ctg_name:"新聞", sub_flg: 1, disp_order: 2, parent_id:6)
Category.create(ctg_name:"参考書", sub_flg: 1, disp_order: 3, parent_id:6)
Category.create(ctg_name:"受験料", sub_flg: 1, disp_order: 4, parent_id:6)
Category.create(ctg_name:"学費", sub_flg: 1, disp_order: 5, parent_id:6)

# Postdatum.delete_all
