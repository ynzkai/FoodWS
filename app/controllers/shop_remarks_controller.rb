class ShopRemarksController < ApplicationController
  before_action :set_remark, only: [:destroy]
  before_action :set_shop, only: [:create]

  def create
    @remark = @shop.shop_remarks.create shop_remark_params.merge(user_id: current_user.id)
    if @remark
      redirect_to :back
    end
  end

  def destroy
    if @remark.destroy
      redirect_to :back
    end
  end

  protected

  def set_remark
    @remark = ShopRemark.find params[:id]
  end

  def set_shop
    @shop = Shop.find params[:shop_id]
  end
  
  def shop_remark_params
    params.require(:shop_remark).permit(:star, :taste, :serve, :environment, :price, :remark, :user_id)
  end
end
