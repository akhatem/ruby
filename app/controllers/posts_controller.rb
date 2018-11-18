class PostsController < ApplicationController
  def index
  	@posts = Post.all.order(created_at: 'desc')
  end

  def show
  	@post = Post.find(params[:id])
	@user = AdminUser.all
  end

  def create
		@post = Post.new(params[:post])
		if @post.save
			redirect_to posts_path, success: "Post Created!"
		else
			render "new"
		end
	end

	def new
		@post = Post.new(params[:post])
		if @post.save
			redirect_to posts_path, success: "Post Created!"
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id])
	end
	
	def update
		@post = Post.find(params[:id])
		
		if @post.update_attributes(params[:post])
			redirect_to post_path, success: "Post Updated!"
		else
			render "edit"
		end
	end
	
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Your post has been deleted"
	end

	private
	def posts_params
		params.require(:post).permit(:title, :body, :search)
	end
end
