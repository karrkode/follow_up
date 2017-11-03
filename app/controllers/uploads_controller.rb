class UploadsController < ApplicationController
  def new
    @upload = Upload.new #refactor -- is this neccessary?
  end

  def create
    secure_id = SecureRandom.uuid
    file = upload_params[:file]
    resp = S3_BUCKET.object(secure_id).upload_file(file.tempfile)

    @upload = Upload.new(name:file.original_filename,
      uploader_id:current_user.id,
      s3_id:secure_id,
      affiliate_id:upload_params[:affiliate_id]
    )

    # Save the upload
    if @upload.save
      redirect_to uploads_path, success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def index
  end

  def destroy
  end

  private

  def upload_params
    params.require(:upload).permit(:file,:uploader_id,:affiliate_id)
  end
end
