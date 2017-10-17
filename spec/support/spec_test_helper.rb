module SpecTestHelper 
	
	def login(user)
		user = User.where(id:user.id).first
		request.session[:user] = user.id
	end

end