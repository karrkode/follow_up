class OrganizationsController < ApplicationController

	def new
		@organization = Organization.new
	end

	def create
		@organization = Organization.new(organization_params)

		if @organization.save
			redirect_to @organization
		else
			render :new
		end
	end

	def show
		binding.pry
	end

	def index
		@organizations = Organization.all
	end

	private 

	def organization_params
		params.require(:organization).permit(:name,:website)
	end



end
