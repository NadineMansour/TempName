class CategoriesController < ApplicationController
	def index
	end

	def new
		@category = Category.new
	end

	def show
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to @category, notice: "You have created #{@category.name} category successfully."
		else
			render action: :new
		end
	end

  protected
  	def category_params
  		params.require(:category).permit(:name)
  	end

end