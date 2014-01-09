class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :body, presence: true
  
  scope :latest, -> { order('created_at DESC') }
end
