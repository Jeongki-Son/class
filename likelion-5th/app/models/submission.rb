class Submission < ApplicationRecord
    belongs_to :assignment, optional: true
    belongs_to :user, optional: true
end
