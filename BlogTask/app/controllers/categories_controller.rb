class CategoriesController < ApplicationController
	#mariam : to be added later
	#before_action :authenticated_user!, only: [:new, :create]
	#end
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def show
		@category = Category.find(params[:id])
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