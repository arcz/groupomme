class Authorization < ActiveRecord::Base
  include AASM
  belongs_to :user
  belongs_to :group
  
  validates :user_id, uniqueness: {scope: :group_id}
  
  aasm column: :role do
    state :member, initial: true
    state :moderator
  end
end
