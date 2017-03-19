class LikesController < ApplicationController
    def like_toggle
        like = Like.find_by(user_id: current_user.id, submission_id: params[:submission_id])
        if like.nil? 
            @like = Like.new
            @like.user_id = current_user.id
            @like.submission_id = params[:submission_id]
            @like.save
        else 
            like.destroy
        end
        redirect_to :back 
    end
    
    private
        def get_parameters
            params.require(:like).permit([:user_id, :submission_id])
        end
end
