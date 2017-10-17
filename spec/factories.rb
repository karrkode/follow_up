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
		street_name {Faker::Address.street_name}
		street_number {[1..5000].sample}
		neighborhood {Faker::Address.community}
		city {Faker::Address.city}
		county {"County of "+Faker::TwinPeaks.character}
		state {Faker::Address.state}
		zip {Faker::Address.zip}
		latitude {Faker::Address.latitude}
		longitude {Faker::Address.longitude}
		address '255 N Fakestreet, Chicago, IL, United States'
	end

	factory :organization do 
		name { Faker::Company.name + ' ' + Faker::Company.suffix }
		website 'www.fakewebsite.com'
	end

	factory :note do 
		info {Faker::Lorem.paragraph}
	end


end