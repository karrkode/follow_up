Organization.create!(name:'Clinton Foundation', website:'https://www.clintonfoundation.org/')

Organization.create!(name:"The People's Lobby", website:'http://www.thepeopleslobbyusa.org/')

Organization.create!(name: 'Our Revolution', website:'https://ourrevolution.com/')

me = User.create!(first_name:'Andrew',last_name:'Carr', email:'aacarr5@gmail.com',password:'password')
5.times {Follower.create!(first_name:Faker::Name.first_name,last_name:Faker::Name.last_name,email:Faker::Internet.email,phone:Faker::PhoneNumber.cell_phone,organization_id:[1,2,3].sample,organizer_id:me.id)}

10.times do |count|
	user = User.create!(first_name:Faker::Name.first_name,last_name:Faker::Name.last_name,email:Faker::Internet.email,password:'password')
	20.times {Follower.create!(first_name:Faker::Name.first_name,last_name:Faker::Name.last_name,email:Faker::Internet.email,phone:Faker::PhoneNumber.cell_phone,organization_id:[1,2,3].sample,organizer_id:user.id)}
end

11.times do |count|
	Membership.create!(user_id:count+1,organization_id:[1,2,3].sample) 
end  