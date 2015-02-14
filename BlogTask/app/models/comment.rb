class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	has_many :replies
	validates :body, length: {
    minimum: 1,
    maximum: 150
	}
end
