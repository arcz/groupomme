class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authorizations, dependent: :destroy
  has_many :groups, through: :authorizations
  has_many :posts, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "60x60#", thumb: "35x35#" }

  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  before_save :check_avatar
  private
  def check_avatar
    unless self.avatar.present?
      file = StringIO.new(Quilt::Identicon.new(SecureRandom.hex, scale: 4).to_blob)
      file.class.class_eval { attr_accessor :original_filename, :content_type }
      file.original_filename = (first_name+last_name+'.png').downcase
      file.content_type = 'image/png'
      self.avatar = file
    end
  end
end
