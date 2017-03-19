class PostsController < ApplicationController
  before_action :post_common, only: [:show, :edit, :update, :destroy]
  before_action :board_common
  impressionist :actions=>[:show,:index]

  def index
    # @post = @board.posts.page(params[:page]).per(10)
    @q = @board.posts.ransack(params[:q])
    @post = @q.result(distinct: true).page(params[:page]).per(10)
    @day = Time.now
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(get_params)
    @board.posts << @post
    current_user.posts << @post
    respond_to do |format|
      if @post.save
        format.html { redirect_to [@board, @post], notice: "글이 안전하게 작성되었습니다." }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    authorize_action_for @post
  end

  def update
    authorize_action_for @post
    
    respond_to do |format|
      if @post.update(get_params)
        format.html { redirect_to [@board, @post], notice: "글이 안전하게 수정되었습니다." }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def show
    @day = Time.now
  end

  def destroy
    authorize_action_for @post
    
    @post.destroy
    respond_to do |format|
      format.html { redirect_to board_posts_path }
    end
  end
  
  private
  def get_params
    params.require(:post).permit([:title, :content])
  end
  def post_common
    @post = Post.find(params[:id])
  end
  def board_common
    @board = Board.find(params[:board_id])
  end
end
