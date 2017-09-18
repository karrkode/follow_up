class OrganizationsController < ApplicationController

	def new
		@organization = Organization.new
	end

	def create
		@organization = Organization.new(organization_params)

		if @organization.save
			redirect_to organizations_path
		else
			render :new
		end
	end

	def show
		@organization = Organization.find_by(id:params[:id])
	end

	def index
		@organizations = Organization.all
	end

	private 

	def organization_params
		params.require(:organization).permit(:name,:website)
	end



end
