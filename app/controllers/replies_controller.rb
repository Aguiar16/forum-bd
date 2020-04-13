class RepliesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:new, :create, :edit, :destroy]
  before_action :set_topic, only: [:new, :create, :edit, :destroy]
  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @reply = Reply.new
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  # POST /replies.json
  def create
    @reply = Reply.new(reply_params)
    @reply.post_id = @post.id

    respond_to do |format|
      if @reply.save
        format.html { redirect_to topic_post_path(@topic,@post), notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render new_topic_post_reply_path(@topic,@post) }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to topic_post_path(@reply.post.topic_id,@reply.post_id), notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render edit_topic_post_reply_path(@reply.post.topic_id,@reply.post_id,@reply) }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to topic_post_path(@topic,@post), notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.require(:reply).permit(:body, :post_id)
    end
end
