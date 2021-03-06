class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :posts
	has_many :comments
	has_many :replies
	#validates_uniqueness_of :username
	validates :information, length: {
    maximum: 240
	}
	validates :signature, length: {
    maximum: 30
	}
	scope :authenticated, -> {
	where(auth: true)
	}
	scope :unauthenticated, -> {
		where(auth:false)
	}
	 mount_uploader :profileImage, ImageUploader
end
