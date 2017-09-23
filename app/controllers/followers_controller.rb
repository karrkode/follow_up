class FollowersController < ApplicationController

	def new
		@follower = Follower.new
	end

	def create
		@follower = Follower.new(follower_params)
		# binding.pry
		if @follower.valid?
			@follower.save
			redirect_to user_path(current_user.id)
		else
			binding.pry
			render :new
			# render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private 

	def follower_params
		params.require(:follower).permit(:first_name,:last_name,:phone,:email,:organizer_id,:organization_id)
	end
end
