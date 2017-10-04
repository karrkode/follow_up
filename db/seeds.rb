Organization.create!(name:'Clinton Foundation', website:'https://www.clintonfoundation.org/')
Organization.create!(name:"The People's Lobby", website:'http://www.thepeopleslobbyusa.org/')
Organization.create!(name: 'Our Revolution', website:'https://ourrevolution.com/')

me = User.create!(first_name:'Andrew',last_name:'Carr', email:'aacarr5@gmail.com',password:'password')
Membership.create(user_id:me.id,organization_id:1)
Membership.create(user_id:me.id,organization_id:2)
Membership.create(user_id:me.id,organization_id:3)
25.times {Follower.create!(first_name:Faker::Name.first_name,last_name:Faker::Name.last_name,email:Faker::Internet.email,phone:Faker::PhoneNumber.cell_phone,organization_id:[1,2,3].sample,organizer_id:me.id)}

10.times do |count|
	user = User.create!(first_name:Faker::Name.first_name,last_name:Faker::Name.last_name,email:Faker::Internet.email,password:'password')
	3.times do |sub_count|
		Membership.create!(user_id:user.id,organization_id:sub_count+1)
		5.times {Follower.create!(first_name:Faker::Name.first_name,last_name:Faker::Name.last_name,email:Faker::Internet.email,phone:Faker::PhoneNumber.cell_phone,organization_id:sub_count+1,organizer_id:user.id)}
	end
end
