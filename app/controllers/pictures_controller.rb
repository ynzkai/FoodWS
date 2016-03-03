class PicturesController < ApplicationController
  before_action :set_picture, only: [:destroy]

  # cancancan
  load_and_authorize_resource

  def create
    # picture = current_user.pictures.build image: params[:image_file]
    # if picture.save
    #   result = { success: true,
    #              file_path: picture.image.url(:large)
    #            }
    #   render json: result.to_json
    # else
    #   result = { success: false,
    #              msg: "图片上传失败",
    #              file_path: ""
    #            }
    #   render json: result.to_json
    # end
     
  end

  def destroy
    @picture.destroy
    render json: {message: "成功删除图片"}
  end

  protected

  def set_picture
    @picture = Picture.find params[:id]
  end
end
