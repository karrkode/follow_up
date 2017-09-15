# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do |count|

	User.create!(first_name:'Andrew'+count.to_s,last_name:'Carr', email:'a'+count.to_s+'@gmail.com',password:'password')

end