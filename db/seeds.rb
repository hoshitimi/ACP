# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  User.create(user_id: 88888, user_acount: "先生", authority: 1, point: 120, password: "aa")
  User.create(user_id: 11111, user_acount: "ああ", authority: 0, point: 120, password: "ii")
