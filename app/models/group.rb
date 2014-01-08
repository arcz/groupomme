class Group < ActiveRecord::Base
  has_many :authorizations, dependent: :destroy
  has_many :users, through: :authorizations
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true
end
