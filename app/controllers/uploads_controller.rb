class UploadsController < ApplicationController
  def new
    @upload = Upload.new #refactor -- is this neccessary?
  end

  def create
    secure_id = SecureRandom.uuid
    file = upload_params[:file]
    resp = S3_BUCKET.object(secure_id).upload_file(file.tempfile)

    if resp #refactor
      upload = Upload.create!(name:file.original_filename,
        uploader_id:current_user.id,
        s3_id:secure_id,
        affiliate_id:upload_params[:affiliate_id]
      )
      Upload.generateTerf(upload,upload_params[:affiliate_id],file,upload.id)
      redirect_to user_uploads_path(user_id:current_user.id, id:upload.id)
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def index
    @uploads = current_user.uploads
  end

  def destroy
  end

  private

  def upload_params
    params.require(:upload).permit(:file,:uploader_id,:affiliate_id)
  end
end
