class ShopsController < ApplicationController
  before_action :set_shop, only: [:face, :upload_picture, :uppics, :show, :edit, :update, :destroy]
  before_action :set_face, only: [:uppics, :upload_picture]
  before_action :authenticate_user!, except: [:index, :show]

  layout "shops_layout"

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.where "state != 0"
  end

  def owner
    @shops = current_user.shops
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
  end

  # GET /shops/new
  def new
    @shop = Shop.new
    @shop.build_address
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    # @shop = Shop.new(shop_params)
    # state 0 means shop is invaliable
    @shop = current_user.shops.new(shop_params.merge state: 0)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to uppics_shop_url(@shop), notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /shops/1/uppics
  def uppics
  end
  # POST /shops/1/upload_picture
  def upload_picture
    @picture = @shop.pictures.create image: params[:shop][:image]

    if @picture
      # state 1 means shop is avaliable now
      @shop.update_attributes state: 1
      render "upload_picture"
      # render json: {pic_path: @picture.image.url(:small), message: "upload success"}
    else
      render js: "alert(upload failed)"
      # render json: {message: "upload fail"}
    end
  end

  # POST /shops/1/face
  def face
    @shop.face_id = params[:picture_id]
    if @shop.save
      render json: {message: "设置成功"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    def set_face
      if @shop.face.nil?
        @shop.face = @shop.pictures.first
        @shop.save
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:name, :description, :state, :area_id, :category_id, :telephone, :contact, :user_id, :face_id)
    end
end
