class Admin::ManageController < ApplicationController
  before_action :can_visit_check_page?
  before_action :authenticate_user!

  def check
    @shops = Shop.where state: 0
    @foods = Food.where state: 0
  end

  protected
  
  def can_visit_check_page?
    unless current_user.supper_admin?
      redirect_to :back
    end
  end
end
