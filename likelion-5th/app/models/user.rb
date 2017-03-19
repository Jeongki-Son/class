class User < ApplicationRecord
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :assignments
  has_many :comments
  has_many :likes
  has_many :submissions
  has_many :posts
  has_many :attendancecounts
  has_many :points
  mount_uploader :profile, ProfileUploader
  
  after_create :set_default_role, if: Proc.new { User.count > 1 }
  
  def is_like?(submission)
    Like.find_by(user_id: self.id, submission_id: submission.id).present?
  end
  
  private 

  def set_default_role
    add_role :user
  end
end
