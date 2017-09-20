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
			render :new
		end
	end

	def new
		@user = User.new
	end

	def edit
		if !relevant_user?
			redirect_to root_path
		end
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user
		else
			render :edit
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		
	end

	private

	def user_params
		params.require(:user).permit(:first_name,:last_name,:email,:affiliation,:password, :password_confirmation, :memberships)
	end

end
