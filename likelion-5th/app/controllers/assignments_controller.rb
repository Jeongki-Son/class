class AssignmentsController < ApplicationController
  before_action :assignment_common, only: [:show, :edit, :update, :destroy]
  
  def index
    @assignment = Assignment.all
  end
  
  def new
    @assignment = Assignment.new
  end
  
  def create
    @assignment = Assignment.new(get_parameters)
    
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: "과제가 안전하게 제출되었습니다!" }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    respond_to do |format|
      if @assignment.update(get_parameters)
        format.html { redirect_to @assignment, notice: "과제가 안전하게 수정되었습니다!" }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @assignment.destroy
    
    respond_to do |format|
      format.html { redirect_to assignments_url }
    end
  end
  
  private
  
  def get_parameters
   params.require(:assignment).permit(:title)
  end
  
  def assignment_common
    @assignment = Assignment.find(params[:id])
  end
  
end
