class Post < ActiveRecord::Base
	#edited_by_mariam
	has_many :mediavideos
	belongs_to :user, dependent: :destroy
	#edited_by_mariam
	#has_many :categories
	has_many :categoryofposts
	has_many :categories, through: :categoryofposts
	has_many :post_attachments
   	accepts_nested_attributes_for :post_attachments
	#has_many :related_categories, class_name: "Category", through: :categoryofposts , source: :category
	#end
	has_many :comments

	validates :body, length: {
    minimum: 1,
    maximum: 400
	}
	validates :title, length: {
    minimum: 1,
    maximum: 60
	}
end
