class Category < ActiveRecord::Base
	#edited by mariam
	#has_many :posts
	has_many :posts
	has_many :related_posts, class_name: "Post", through: :categoryofposts , source: :post
end
