class HomeController < ApplicationController
    def index
       @post = Board.find(1).posts
    end
    
    def mypage
        @day = Time.now
        @user = User.find(params[:id])
        if Assignment.all == []
            @assignment_percent
        else
            @assignment_percent = ((@user.submissions.count.to_f / Assignment.count.to_f)*100).to_i
        end
        if Attendance.all == []
            @attendance_percent
        else
            @attendance_percent = ((@user.attendancecounts.count.to_f / Attendance.count.to_f)*100).to_i
        end
    end
    
    def mypoint
        @user = User.find(params[:id])
        @day = Time.now
        @point = 0
        @user.points.each do |point|
            @point = @point + point.point
        end
    end
    
    def pointmaker
        @point = Point.new
        @pointhash = Hash.new
        @pointhash = {
            "자체 모임스터디" => 2,
            "Codecademy 이수" => 10,
            "5회 연속 개근" => 10,
            "과제 웰메이드" => 2,
            "미제출과제 제출" => 1,
            "지각" => -5,
            "과제 지각 제출" => -2,
            "과제 미제출" => -10
        }
        if current_user.roles.find_by(name: "admin").nil?
            redirect_to :back
        end
    end
    
    def pointcreate
        @point = Point.new(get_parameters)
        User.find_by_name(@point.username).points << @point
        @point.save
        redirect_to :back
        # respond_to |format|
        # if @point.save
        # else
        # end
    end
    
    private
    def get_parameters
        params.require(:point).permit([:username, :point, :reason])
    end
end
