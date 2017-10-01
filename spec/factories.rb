FactoryGirl.define do 
	factory :user do 
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password 'password'
	end

	factory :follower do 
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		phone { Faker::PhoneNumber.cell_phone }
	end

	factory :organization do 
		name { Faker::Company.name + ' ' + Faker::Company.suffix }
		website 'www.fakewebsite'
	end

end