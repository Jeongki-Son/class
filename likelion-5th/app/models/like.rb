class Like < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :submission, optional: true
end
