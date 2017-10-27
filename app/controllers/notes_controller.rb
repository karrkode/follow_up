class NotesController < ApplicationController
	protect_from_forgery with: :null_session

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(notes_params)

		if @note.save 
			respond_to do |format|
				@note.add_tags(params["note"]["tag_ids"])
				format.json {render head:"ok", json:{data:@note.toNoteDiv}} #refactor?
				format.html { root_path }
			end
		else 
			respond_to do |format| 
				format.json {render json: @note.errors, status: :unprocessable_entity}
			end
		end

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
		params.require(:note).permit(:author_id,:notable_type,:notable_id,:info,:tag_ids)
	end

end