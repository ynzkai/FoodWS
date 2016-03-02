class RemarksController < ApplicationController
  def create
    @remark = Remark.new remark_params.merge(user_id: current_user.id)
    if @remark.save
      if params[:remark][:remarkable_type] == 'Shop'
        redirect_to shop_path(params[:remark][:remarkable_id])
      else
        redirect_to food_path(params[:remark][:remarkable_id])
      end
    else
      redirect_to :back
    end
  end

  def delete
  end

  protected

  def remark_params
    params.require(:remark).permit(:content, :user_id, :remarkable_id, :remarkable_type)
  end
end
