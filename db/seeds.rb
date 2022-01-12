# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  User.create(user_id: 88888, user_acount: "先生", authority: 1, point: 120, password: "aa")
  User.create(user_id: 11111, user_acount: "ああ", authority: 0, point: 120, password: "ii")
  User.create(user_id: 191407, user_acount: "小村真輝", authority: 0, point: 10, password: "look7122")
  User.create(user_id: 191430, user_acount: "星野七海", authority: 1, point: 0, password: "11111")
  Question.create(user_code: 191407, category: "日常", title: "自分の時間が取れない", contents: "部活や勉強に時間を割いてしまい、自分の時間が取れません。何かいい時間の使い方はありますか？")
  Question.create(user_code: 191430, category: "勉強", title: "漢字の範囲がわからない", contents: "今度のテストの漢字の範囲がわからない！助けてください！３年 生です")
