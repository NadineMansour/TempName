class CommentsController < ApplicationController
  def index 
  end

  def show

  end

  def new
    session[:post_id] = params[:post_id]
    @comment = Comment.new
  end

	def create
		@comment_params = comment_params
		@comment_params[:post_id] = params[:post_id]
		
		#@comment_params[:user_id] = session[:user_id]
		@comment = Comment.new(@comment_params)
		if @comment.save
			redirect_to post_path(params[:post_id])
		else 
			redirect_to post_path(params[:post_id])
    end
  end

  def edit  
  end 

  def update
  end

  def destroy
  end

protected
  def comment_params
    params.require(:comment).permit(:body)
  end


end 