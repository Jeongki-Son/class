class AddUserToAttendancecount < ActiveRecord::Migration[5.0]
  def change
    add_reference :attendancecounts, :user, foreign_key: true
  end
end
