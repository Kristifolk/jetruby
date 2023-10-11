class PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]
    before_action :authorize_user, except: [:index, :show]
    pp(11111111111111111111111111) 
    # GET /posts or /posts.json
    def index
        pp(222222222222222)
        @posts = Post.all
        @my_posts = Post.where(user_id: current_user.id)
    end
  
    # GET /posts/1 or /posts/1.json
    def show
        pp(333333333333333333333333)
    end
  
    # GET /posts/new
    def new
        pp(44444444444444444444444)
        @post = Post.new
    end
  
    # GET /posts/1/edit
    def edit
        pp(55555555555555555555555)
        @post = Post.find_by(user_id: current_user.id, id: (params[:id]))
        if @post.nil?
            pp(666666666666666666666666)
            redirect_to root_path
        end
    end
  
    # POST /posts or /posts.json
    def create
    pp(888888888888888888888888) 
    pp(@post) 
    pp(post_params)      
      @post = Post.new(post_params)
      @post.user_id = current_user.id
        respond_to do |format|
            if @post.save
                pp(999999999999999999999)
            format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
            format.json { render :show, status: :created, location: @post }
            else
                pp(101010101010101010)
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
        
    end
  
    
    # PATCH/PUT /posts/1 or /posts/1.json
    def update
        pp(1111111111111111111111111111)
      respond_to do |format|
        if @post.update(post_params)
            pp(121212121212121212)
          format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
          format.json { render :show, status: :ok, location: @post }
        else
            pp(1313131313131313131313)
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /posts/1 or /posts/1.json
    def destroy
        pp(14141414141414141414141)
      @post.destroy
  
      respond_to do |format|
        pp(1515151515151515151515)
        format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    def authorize_user
        pp(1616161616161616161616)
        if current_user
            pp(17171717171717171717)
          return true
        else
            pp(1818181818181818)
          redirect_to root_path, alert: "You are not authorized to edit this post."
        end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        pp(191919191919191919)
        @post = Post.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def post_params
        pp(20202020202020202020)
        params.require(:post).permit(:id, :img_name, :description, :user_id, :img)
      end
end
