class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)

		if @user.valid?
			@user.save
			redirect_to @user
		else
			# binding.pry
			render :new
		end
	end

	def new
		@user = User.new
	end

	def edit
	end

	def update
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
	end

	private

	def user_params
		params.require(:user).permit(:first_name,:last_name,:email,:affiliation)
	end

end
