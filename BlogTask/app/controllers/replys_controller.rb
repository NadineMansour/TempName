class ReplysController < ApplicationController

def index	
	end

	def show

	end

	def new
		session[:comment_id] = params[:comment_id]
		@reply = Reply.new
	end

	def create
		@reply_params = reply_params
		@reply_params[:comment_id] = params[:comment_id]
		
		#@comment_params[:user_id] = session[:user_id]
		@reply = Reply.new(@reply_params)
		if @reply.save
			redirect_to '/posts/:id'
		else 
			redirect_to '/posts/:id'
		end

	end

	def edit	
	end 

	def update
	end

	def destroy
	end

protected
 	def reply_params
		params.require(:reply).permit(:body)
	end


end 


end