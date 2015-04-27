class PostsController < ApplicationController
	def index
		@posts = Post.all.order("created_at DESC")
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def create
		# @post = Post.new(post_params)
		# @post.user_id = current_user.id

		@user = current_user
		@post = @user.posts.new(post_params)

		if @post.valid? 
			if @post.save
				redirect_to post_path(@post)
			else
				render :new
			end
		else
			redirect_to new_post_path
		end
	end

	def edit
		@post = Post.find(params[:id])
			unless current_user.id == @post.user_id
				redirect_to post_path
			end
	end

	def update
		@post = Post.find(params[:id])	
			if @post.valid?
				if @post.update(post_params)
					redirect_to posts_path
				else
					render :edit
				end
			else
				redirect_to edit_post_path
			end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :image)
	end

end

