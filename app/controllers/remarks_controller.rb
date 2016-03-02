class RemarksController < ApplicationController
  def create
    @remark = Shop.find(params[:shop_id]).remarks.build remark_params.merge(user_id: current_user.id)
    if @remark.save
      redirect_to shop_path(params[:shop_id])
    else
      redirect_to :back
    end
  end

  def delete
  end

  protected

  def remark_params
    params.require(:remark).permit(:content, :user_id)
  end
end
