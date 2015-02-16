class Comment < ActiveRecord::Base
	#edited_by_mariam
	belongs_to :user , dependent: :destroy
	belongs_to :post , dependent: :destroy
	#end
	has_many :replies
	validates :body, length: {
    minimum: 1,
    maximum: 150
	}
end
