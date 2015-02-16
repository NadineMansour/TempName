class Category < ActiveRecord::Base
	#edited by mariam
	#has_many :posts
	belongs_to :user
	validates :name, uniqueness: true
	has_many :categoryofposts
	has_many :related_posts, class_name: "Post", through: :categoryofposts , source: :post
	#end mariam
end
