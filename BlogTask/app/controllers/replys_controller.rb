class ReplysController < ApplicationController

def index 
  end

  def show

<<<<<<< HEAD

	end
=======
  end
>>>>>>> 8c45fa972244f1fd084224794f18ad340e0dab36

  def new
    session[:comment_id] = params[:comment_id]
    @reply = Reply.new
  end

<<<<<<< HEAD
	def create
		@reply_params = reply_params
		@reply_params[:comment_id] = params[:comment_id]
		@c=Comment.find(params[:comment_id])
		
		#@comment_params[:user_id] = session[:user_id]
		@reply = Reply.new(@reply_params)
		if @reply.save
			redirect_to  post_path(@c.post_id)
		else 
			redirect_to  post_path(@c.post_id)
		end
=======
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
>>>>>>> 8c45fa972244f1fd084224794f18ad340e0dab36

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


<<<<<<< HEAD
=======
end
>>>>>>> 8c45fa972244f1fd084224794f18ad340e0dab36
