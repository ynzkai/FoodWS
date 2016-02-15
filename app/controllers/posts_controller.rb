class PostsController < ApplicationController
  # because cancancan already autoload @post, so comment the following line
  # before_action :set_post, only: [:show, :edit, :update, :destroy]

  layout "post_layout"

  # cancancan
  load_and_authorize_resource


  # GET /posts
  # GET /posts.json
  def index
    @topics = Topic.all

    if params[:topic_id].nil?
      @posts = Post.paginate(:page => params[:page])
    elsif
      @active_topic = Topic.find(params[:topic_id])
      # @posts = @active_topic.posts
      @posts = Post.where(topic_id: @active_topic.id).paginate(:page => params[:page])

    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.display_count += 1
    @post.save
    @comments = Comment.where(post_id: @post.id).paginate(:page => params[:page])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    params_with_userid = post_params
    params_with_userid[:user_id] = current_user.id
    @post = Post.new(params_with_userid)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        response.location = "posts/new"
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # upload picture
  def pictures
    picture = current_user.pictures.build image: params[:image_file]
    if picture.save
      result = { success: true,
                 file_path: picture.image.url(:large)
               }
      render json: result.to_json
    else
      result = { success: false,
                 msg: "图片上传失败",
                 file_path: ""
               }
      render json: result.to_json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :topic_id, :user_id)
    end
end
