class Assignment < ApplicationRecord
    has_many :submissions
    has_and_belongs_to_many :users
end
