class Group < ActiveRecord::Base
  has_many :authorizations, dependent: :destroy
  has_many :moderator_authorizations, -> { moderator }, class_name: 'Authorization', dependent: :destroy
  has_many :users, through: :authorizations
  has_many :moderators, through: :moderator_authorizations, source: :user
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true
end
