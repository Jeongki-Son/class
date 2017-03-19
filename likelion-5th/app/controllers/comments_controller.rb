class CommentsController < ApplicationController
    def new
      @commentable = find_commentable
      @comment = @commentable.comments.new
    end
    def create
      @commentable = find_commentable
      @comment = @commentable.comments.new(get_params)
      User.find(current_user.id).comments << @comment
      respond_to do |format|
        if @comment.save
          format.html { redirect_to :back, notice: "댓글이 안전하게 작성되었습니다!" }
        else
          format.html { render action: 'new' }
        end
      end
    end
    def update
      
      @comment = Comment.find(params[:id])
      respond_to do |format|
        if @comment.update(get_params)
          format.html { redirect_to :back, notice: "댓글이 안전하게 수정되었습니다." }
        else
          format.html { render action: 'edit' }
        end
      end
    end
    def destroy
      
      @comment = Comment.find(params[:id])
      respond_to do |format|
        if @comment.destroy
          format.html { redirect_to :back, notice: "댓글이 안전하게 삭제되었습니다." }
        else
          format.html { render action: 'edit' }
        end
      end
    end
    private
    def get_params
      params.require(:comment).permit([:content])
    end
    def find_commentable
      if params[:assignment_id]
        Assignment.find(params[:assignment_id]).submissions.find(params[:submission_id])
      elsif params[:board_id]
        Board.find(params[:board_id]).posts.find(params[:post_id])
      end
    end
end
