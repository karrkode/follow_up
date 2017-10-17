class NotesController < ApplicationController

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def notes_params
		params.require(:note).permit(:author_id,:notable_type,:noteable_id)
	end

end