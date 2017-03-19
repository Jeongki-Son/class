class CreateAttendancecounts < ActiveRecord::Migration[5.0]
  def change
    create_table :attendancecounts do |t|
      t.string :name

      t.timestamps
    end
  end
end
