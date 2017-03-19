class Attendancecount < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :attendance, optional: true
end
