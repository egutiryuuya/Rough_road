# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(password:"admin@12345", email: 'foo@example.com')
Customer.create!(
 [
 {email: 'olivia@test.com', name: 'Olivia', password: 'Olivia123'},
 {email: 'james@test.com', name: 'James', password: 'James123'},
 {email: 'lucas@test.com', name: 'Lucas', password: 'Lucas123'},
 {email: 'yoneda@test.com', name: '米田', password: 'Olivia124'},
 {email: 'nemo@test.com', name: '根本', password: 'James124'},
 {email: 'gojou@test.com', name: '五条悟', password: 'Lucas125'},
 {email: 'nanami@test.com', name: '七海健斗', password: 'Lucas126'},
 {email: 'itadori@test.com', name: '虎杖裕司', password: 'Lucas127'},
 {email: 'hushiguro@test.com', name: '伏黒恵', password: 'Lucas128'},
 {email: 'kugisaki@test.com', name: '釘崎', password: 'Lucas129'}
 ]
)

