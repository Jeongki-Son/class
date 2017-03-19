# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'seoultech@likelion.org', password: '123456', password_confirmation: '123456')
admin_user = User.create( name: "관리자", email: 'seoultech@likelion.org', password: '123456')
admin_user.add_role :admin
Board.create!(title:'공지사항')
Board.create!(title:'건의사항')
Board.create!(title:'자유게시판')