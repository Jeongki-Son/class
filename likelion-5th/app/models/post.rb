class Post < ApplicationRecord
    resourcify
    include Authority::Abilities
    is_impressionable
    
    has_many :comments, as: :commentable
    belongs_to :board, optional: true
    belongs_to :user, optional: true
    mount_uploader :imagefile, ImagefileUploader
    
end
