class FollowersController < ApplicationController

	def new
		redirect_to root_path if !relevant_user?
		@follower = Follower.new
	end

	def create
		@follower = Follower.new(follower_params)
		if @follower.valid?
			@follower.save
			redirect_to user_path(current_user.id)
		else
			render :new
		end
	end

	def edit
		if !relevant_user?
			redirect_to root_path
		end
	end

	def show
		redirect_to root_path if !relevant_user?
		@follower = Follower.find_by(id:params[:id])
	end

	def update
	end

	def destroy
	end

	private 

	def follower_params
		params.require(:follower).permit(:first_name,:last_name,:phone,:email,:organizer_id,:organization_id,:address, :longitude, :latitude, :zip, :street_number, :street_name, :city, :neighborhood, :state)
	end
end
