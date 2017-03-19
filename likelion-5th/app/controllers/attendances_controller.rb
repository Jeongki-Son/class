class AttendancesController < ApplicationController
  def index
    @attendance = Attendance.all
    @attendancecount = Attendancecount.new
  end
end
