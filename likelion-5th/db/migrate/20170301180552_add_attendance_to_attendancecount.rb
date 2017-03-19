class AddAttendanceToAttendancecount < ActiveRecord::Migration[5.0]
  def change
    add_reference :attendancecounts, :attendance, foreign_key: true
  end
end
