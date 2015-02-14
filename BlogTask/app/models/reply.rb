class Reply < ActiveRecord::Base	
	belongs_to :user
	belongs_to :comment
	validates :body, length: {
    minimum: 1,
    maximum: 150
	}
end
