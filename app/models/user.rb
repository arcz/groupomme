class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authorizations, dependent: :destroy
  has_many :groups, through: :authorizations
  has_many :posts, dependent: :destroy
  
  def name
    "#{first_name} #{last_name}"
  end
end
