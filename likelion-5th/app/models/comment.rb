class Comment < ApplicationRecord
    resourcify
    include Authority::Abilities
    
    belongs_to :commentable, polymorphic: true
    belongs_to :user, optional: true
end
