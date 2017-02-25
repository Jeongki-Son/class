class Post < ApplicationRecord
    belongs_to :board, optional: true
    belongs_to :user, optional: true
end
