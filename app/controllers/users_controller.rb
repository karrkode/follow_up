class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
			ids = params[:user][:affiliation_ids][1..-1]
			ids.each {|id| Membership.create!(user_id:@user.id,organization_id:id.to_i)}
			redirect_to @user
		else
			render :new
		end
	end

	def new
		@user = User.new
	end

	def edit
		redirect_to root_path if !relevant_user?
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
		redirect_to root_path if !relevant_user?
		@user = User.find(params[:id])
	end

	def destroy
	end

	private

	def user_params
		params.require(:user).permit(:first_name,:last_name,:email,:affiliation,:password, :password_confirmation)
	end

end
