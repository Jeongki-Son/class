class Submission < ApplicationRecord
    resourcify
    include Authority::Abilities

    has_many :comments, as: :commentable
    has_many :likes
    belongs_to :assignment, optional: true
    belongs_to :user, optional: true
    
    mount_uploader :imagefile, ImagefileUploader
end
