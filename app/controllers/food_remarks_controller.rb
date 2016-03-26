class FoodRemarksController < ApplicationController
  before_action :set_remark, only: [:destroy]
  before_action :set_food, only: [:create]

  def create
    @remark = @food.food_remarks.create food_remark_params.merge(user_id: current_user.id)
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
    @remark = FoodRemark.find params[:id]
  end

  def set_food
    @food = Food.find params[:food_id]
  end
  
  def food_remark_params
    params.require(:food_remark).permit(:star, :remark, :user_id)
  end
end
