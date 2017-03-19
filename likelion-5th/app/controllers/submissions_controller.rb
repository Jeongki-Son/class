class SubmissionsController < ApplicationController
  before_action :submission_common, only: [:show, :edit, :update, :destroy]
  before_action :assignment_common
  
  def index
    @submission = Submission.all
    @assignment = Assignment.find(params[:assignment_id])
  end
  
  def new
    @submission = Submission.new
  end
  
  def create
    @submission = Submission.new(get_parameters)
    Assignment.find(params[:assignment_id]).submissions << @submission
    Assignment.find(params[:assignment_id]).users << User.find(params[:user_id])
    User.find(params[:user_id]).submissions << @submission
    
    respond_to do |format|
      if @submission.save
        format.html { redirect_to [@assignment, @submission], notice: "과제가 안전하게 제출되었습니다!" }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def edit
    authorize_action_for @submission
  end
  
  def show
  end
  
  def update
    authorize_action_for @submission
    
    respond_to do |format|
      if @submission.update(get_parameters)
        format.html { redirect_to [@assignment, @submission], notice: "과제가 안전하게 수정되었습니다!" }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    authorize_action_for @submission
    
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url }
    end
  end
  
  private
  
  def get_parameters
   params.require(:submission).permit(:herokuurl, :giturl, :content, :imagefile)
  end
  
  def submission_common
    @submission = Submission.find(params[:id])
  end
  
  def assignment_common
    @assignment = Assignment.find(params[:assignment_id])
    @user = current_user
  end
end
