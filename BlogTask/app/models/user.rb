class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :replies
	validates_uniqueness_of :username
	validates :information, length: {
    minimum: 0,
    maximum: 240
	}
	validates :signature, length: {
    minimum: 0,
    maximum: 30
	}
	scope :authenticated, -> {
	where(auth: true)
	}
end
