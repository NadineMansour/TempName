class UsersController < ApplicationController
	def index
	end

	def show
		@post = Post.new
	end
end