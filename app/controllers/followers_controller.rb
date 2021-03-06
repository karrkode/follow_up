class FollowersController < ApplicationController

	def new
		redirect_to root_path if !relevant_user?
		@follower = Follower.new
	end

	def create
		@follower = Follower.new(follower_params)
		if @follower.valid?
			@follower.save
			@follower.add_tags(params["follower"]["tag_ids"]) #refactor
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
		@follower = Follower.where(id:params[:id])[0]
		@notes = Note.where(author_id:@follower.id)
		@note = Note.new
	end

	def update
	end

	def destroy
	end


	private 

	def follower_params
		params.require(:follower).permit(:first_name,:last_name,
		:phone,:email,:organizer_id,:organization_id,
		:address, :longitude, :latitude, :zip,
		:street_number, :street_name,
		:city, :neighborhood, :state,:tag_ids)
	end
end
