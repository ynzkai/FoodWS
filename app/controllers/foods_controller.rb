class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :set_shop, only: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index_all, :show]

  # cancancan
  load_and_authorize_resource

  layout "foods_layout"

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.where(shop_id: @shop.id).order created_at: :desc
  end

  def index_all
    @foods = Food.where(state: 1).paginate(:page => params[:page])
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
    @remarks = @food.food_remarks.order(created_at: :desc).paginate(:page => params[:page])
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params.merge shop_id: params[:shop_id], user_id: current_user.id, state: 0) # 0 means invalid

    respond_to do |format|
      if @food.save
        format.html { redirect_to shop_foods_path(@shop), notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      # if food is passed, won't check it again.
      if @food.state == 1
        state = 1 
      else
        state = 0
      end

      if @food.update(food_params.merge state: state) # 1 means valid
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check
    if params[:check].nil?
      @food.update state: 1
    elsif params[:check] == "no"
      @food.update state: 2
    end
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    def set_shop
      @shop = Shop.find params[:shop_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:user_id, :shop_id, :name, :description, :state, :unit, :price, :discount_price, picture_attributes: [:image])
    end
end
