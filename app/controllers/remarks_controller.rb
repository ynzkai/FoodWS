class RemarksController < ApplicationController
  # cancancan
  load_and_authorize_resource

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

  def destroy
    Remark.find(params[:id]).destroy
    redirect_to :back
  end

  protected

  def remark_params
    params.require(:remark).permit(:content, :user_id, :remarkable_id, :remarkable_type)
  end
end
