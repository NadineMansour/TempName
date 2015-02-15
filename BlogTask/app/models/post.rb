class Post < ActiveRecord::Base
	belongs_to :user
	has_many :categories
	has_many :comments
	has_many :image
	validates :content, length: {
    minimum: 1,
    maximum: 400
	}
	validates :title, length: {
    minimum: 1,
    maximum: 60
	}
	mount_uploader :image, ImageUploader 
end
