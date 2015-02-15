class Post < ActiveRecord::Base
	belongs_to :user

	#edited by mariam
	#has_many :categories
	has_many :categoryofpost
	has_many :related_categories, class_name: "Category", through: :categoryofposts , source: :category
	# end
	has_many :comments
	validates :content, length: {
    minimum: 1,
    maximum: 400
	}
	validates :title, length: {
    minimum: 1,
    maximum: 60
	}
end
