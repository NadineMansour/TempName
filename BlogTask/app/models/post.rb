class Post < ActiveRecord::Base
	#edited_by_mariam
	belongs_to :user, dependent: :destroy
	#edited_by_mariam
	#has_many :categories
	has_many :categoryofposts
	has_many :related_categories, class_name: "Category", through: :categoryofposts , source: :category
	#end
	has_many :comments
	has_many :image
	validates :body, length: {
    minimum: 1,
    maximum: 400
	}
	validates :title, length: {
    minimum: 1,
    maximum: 60
	}
	mount_uploader :image, ImageUploader 
end
