# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  User.create(user_id: 88888, user_acount: "先生", authority: 1, point: 120, password: "aa")
  User.create(user_id: 11111, user_acount: "ああ", authority: 0, point: 120, password: "ii")
  User.create(user_id: 999999, user_acount: "はなこさん", authority: 0, point: 770, password: "aaaaa")
  User.create(user_id: 191407, user_acount: "小村真輝", authority: 0, point: 10, password: "look7122")
  User.create(user_id: 123123, user_acount: "やまもも", authority: 0, point: 10, password: "momomi")
  User.create(user_id: 11, user_acount: "山﨑百珠", authority: 0, point: 10, password: "momomi")
  Question.create(user_code: 191407, category: "日常", title: "自分の時間が取れない", contents: "部活や勉強に時間を割いてしまい、自分の時間が取れません。何かいい時間の使い方はありますか？")
  Question.create(user_code: 191430, category: "勉強", title: "漢字の範囲がわからない", contents: "今度のテストの漢字の範囲がわからない！助けてください！３年 生です")
  Book.create(isbn: 110110, user_id: 123123, title: "ジョージ", author_name: "ジョージ", book_number: 11)
  User.create(user_id: 191407, user_acount: "小村真輝", authority: 1, point: 10, password: "11111")
  User.create(user_id: 191430, user_acount: "星野七海", authority: 1, point: 0, password: "11111")
  User.create(user_id: 191435, user_acount: "山崎百珠", authority: 1, point: 0, password: "11111")
  #Question.create(user_code: 191407, category: "学校生活", title: "○○先生の居場所", contents: "○○先生って定期的にいなくなるけど、どこにいるんだろう？だれかわかりませんか？")
  #Question_reviews.create(user_code: , )
  #Question.create(user_code: 191430, category: "勉強", title: "漢字の範囲がわからない", contents: "今度のテストの漢字の範囲がわからない！助けてください！３年生です")
  #question.create(user_code: 191435, category: "日常", title: "本を買いたい", contents: "図書室でたまたま見つけたあの本。探しているけどなかなか見つからなくて困っています。だれかわかりませんか？")
