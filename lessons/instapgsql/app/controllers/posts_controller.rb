class PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]
    before_action :authorize_user, except: [:index, :show]

    # GET /posts or /posts.json
    def index
      @posts = Post.all
      @my_posts = Post.where(user_id: current_user.id)
    end
  
    # GET /posts/1 or /posts/1.json
    def show
    end
  
    # GET /posts/new
    def new
        @post = Post.new
    end
  
    # GET /posts/1/edit
    def edit
    end
  
    # POST /posts or /posts.json
    def create
    pp(111) 
    pp(@post) 
    pp(post_params)      
      @post = Post.new(post_params)
      @post.user_id = current_user.id
        respond_to do |format|
            if @post.save
            format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
            format.json { render :show, status: :created, location: @post }
            else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
        
    end
  
    
    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /posts/1 or /posts/1.json
    def destroy
      @post.destroy
  
      respond_to do |format|
        format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    def authorize_user
        if current_user
          return true
        else
          redirect_to root_path, alert: "You are not authorized to edit this post."
        end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:id, :img_name, :description, :user_id, :img)
      end
end
