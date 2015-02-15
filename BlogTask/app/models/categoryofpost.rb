class Categoryofpost < ActiveRecord::Base
	#edited by mariam
	belongs_to :post
	belongs_to :category
end
