class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @like = current_user.likes.find_by like_params
    if @like
      current_user.likes.destroy @like
    else
      current_user.likes.create like_params
    end

    @likable_id = params[:likable_id]
    @likable_type = params[:likable_type]
    @count = Like.where(like_params).count

  end

  def destroy
  end

  protected

  def like_params
    params.permit(:likable_id, :likable_type)
  end
end
