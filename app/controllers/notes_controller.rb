class NotesController < ApplicationController

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(notes_params)
	end

	def edit
		@note = Note.find(params[:id])
	end

	def update
		@note = Note.find(params[:id])
		@note.update_attributes!(notes_params)
	end

	def destroy
	end

	private

	def notes_params
		params.require(:note).permit(:author_id,:notable_type,:noteable_id)
	end

end