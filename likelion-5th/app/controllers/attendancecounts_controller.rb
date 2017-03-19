class AttendancecountsController < ApplicationController
  def create
    @attendancecount = Attendancecount.new(get_parameters)
    Attendance.find(params[:attendance_id]).attendancecounts << @attendancecount
    User.find(current_user.id).attendancecounts << @attendancecount
    respond_to do |format|
      if @attendancecount.save
        format.html { redirect_to :back, notice: "출석되었습니다!" }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def show
    @attendance = Attendancecount.find(params[:id])
  end

  private
  def get_parameters
    params.require(:attendancecount).permit([:name])
  end
end
