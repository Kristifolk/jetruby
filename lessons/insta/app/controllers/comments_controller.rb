class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authorize_user, except: [:index, :show]

  # GET /comments or /comments.json
  def index
    pp(11111111111111)
    @comments = Comment.where(post_id: params[:post_id])
   end

  helper_method :back

  def back
    pp(22222222222222222)
    request.referer
  end

  # GET /comments/1 or /comments/1.json
  def show
    pp(33333333333333333333333)
  end

  # GET /comments/new
  def new
    pp(4444444444444444444444)
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    pp(55555555555555555555555)
    @comment = Comment.find_by(user_id: current_user.id, id: (params[:id]))
    if @comment.nil?
        pp(666666666666666666666666)
        redirect_to root_path
    else
        pp(777777777777777777777777)
    end
  end

  # POST /comments or /comments.json
  def create
    pp(888888888888888888888)
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    respond_to do |format|
      if @comment.save
        pp(99999999999999999999999)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        pp(101010101010010101010)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    pp(1212121212121212121)
    @comments = Comment.where(post_id: params[:post_id])
    respond_to do |format|
      if @comment.update(comment_params)
        pp(1313131313131313)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        pp(141414141414141414141414)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    pp(1515151515151515)
    @comment.destroy

    respond_to do |format|
        pp(191919191919)
      format.html { redirect_to comments_url(post_id: @comment.post_id), notice: "Comment was successfully destroyed." }
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
    def set_comment
        pp(20202020202020)
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
        pp(21212121212121)
      params.require(:comment).permit(:message, :post_id, :user_id)
    end
end
